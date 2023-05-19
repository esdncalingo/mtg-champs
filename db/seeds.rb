# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Inistial Client
Client.create(token: 'd44050c4e18a75e2814cd92a9767b9bb4d674a45')

# Initial Users
User.create_account(email: 'daniel@email.com', nickname: 'daniel', password: '12345678')
User.create_account(email: 'anthony@email.com', nickname: 'anthony', password: '12345678')
User.create_account(email: 'mark@email.com', nickname: 'mark', password: '12345678')
User.create_account(email: 'john@email.com', nickname: 'john', password: '12345678')
User.create_account(email: 'vivian@email.com', nickname: 'vivian', password: '12345678')
User.create_account(email: 'ronaldo@email.com', nickname: 'ronaldo', password: '12345678')