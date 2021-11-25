//
//  CoreDataManager.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 23/11/21.
//

import CoreData

internal struct CoreDataManager {

    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "time_sete_app")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }

        return container
    }()

    // MARK: Create
    func createUser(name: String, email: String, password: String) -> User? {

        let context = persistentContainer.viewContext

        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as? User

        user?.name = name
        user?.email = email
        user?.password = password

        do {
            try context.save()
            return user
        } catch let createError {
            print("Failed to create: \(createError)")
        }

        return nil
    }

    // MARK: Fetch Users
    func fetchUsers() -> [User]? {

        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<User>(entityName: "User")

        do {
            let users = try context.fetch(fetchRequest)
            return users
        } catch let fetchError {
            print("Failed to fetch users: \(fetchError)")
        }

        return nil
    }

    // MARK: Fetch Users
    func fetchUser(with email: String) -> User? {

        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "email = %@", email)

        do {
            let user = try context.fetch(fetchRequest)
            return user.first
        } catch let fetchError {
            print("Failed to fetch this user: \(fetchError)")
        }

        return nil
    }

    // MARK: Update
    func updateUser(user: User) {

        let context = persistentContainer.viewContext

//        editar senha
//        user.password = "ff"

        do {
            try context.save()
        } catch let updateError {
            print("Failed to update password: \(updateError)")
        }
    }

    // MARK: Delete
    func deleteUser(user: User) {

        let context = persistentContainer.viewContext
        context.delete(user)

        do {
            try context.save()
        } catch let deleteError {
            print("Failed to delete this user: \(deleteError)")
        }
    }
}
