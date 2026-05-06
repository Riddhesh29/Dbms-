// Create Database
use UserDB

// Create Collection and Insert Data
db.users.insertMany([
    {name: "Rahul", age: 20, sales: 5000},
    {name: "Sneha", age: 22, sales: 7000},
    {name: "Amit", age: 25, sales: 6000}
])

// Read
db.users.find()

// Update
db.users.updateOne(
    {name: "Rahul"},
    {$set: {age: 21}}
)

// Delete
db.users.deleteOne({name: "Amit"})

// Aggregation
db.users.aggregate([
    {
        $group: {
            _id: null,
            totalSales: {$sum: "$sales"},
            averageAge: {$avg: "$age"}
        }
    }
])

// Create Index
db.users.createIndex({name: 1})