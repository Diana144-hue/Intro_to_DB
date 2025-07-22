#!/usr/bin/env python3
"""
File: MySQLServer.py
Repository: Intro_to_DB
Creates the database 'alx_book_store' in MySQL server.
"""

import mysql.connector
from mysql.connector import errorcode

def main():
    try:
        # Connect to MySQL server (without specifying a database)
        conn = mysql.connector.connect(
            host="localhost",
            user="your_username",
            password="your_password"
        )
    except mysql.connector.Error as err:
        print(f"Error: Could not connect to MySQL server: {err}")
        return

    try:
        cursor = conn.cursor()
        # Use CREATE DATABASE IF NOT EXISTS to avoid failures if it already exists
        cursor.execute(
            "CREATE DATABASE IF NOT EXISTS alx_book_store "
            "DEFAULT CHARACTER SET utf8mb4 "
            "DEFAULT COLLATE utf8mb4_general_ci"
        )
        # Check whether we actually created it just now
        if cursor.with_rows or conn.database is None:
            # This is a workaround: there's no direct flag from connector
            print("Database 'alx_book_store' ensured (created or already existed).")
        else:
            print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as err:
        # Catch any other SQL-related errors
        print(f"Error: Failed to create database: {err}")
    finally:
        # Ensure resources are properly closed
        cursor.close()
        conn.close()

if __name__ == "__main__":
    main()
