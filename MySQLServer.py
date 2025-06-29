#!/usr/bin/env python3
import mysql.connector
from mysql.connector import errorcode

def create_database():
    try:
        # Establish connection to MySQL server (adjust credentials as needed)
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Kivanani@2021"
        )
        cursor = conn.cursor()

        # Try to create the database
        try:
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!", flush=True)
        except mysql.connector.Error as err:
            print(f"Failed creating database: {err}", flush=True)
        finally:
            cursor.close()
            conn.close()

    except mysql.connector.Error as err:
        print("Error connecting to the database:", flush=True)
        print(err)

if __name__ == "__main__":
    create_database()
