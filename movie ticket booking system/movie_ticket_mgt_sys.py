from movie import Movie
from user import User
import pickle

class ManagementSystem:
    def __init__(self):
        self.movies = []
        self.users = []

    def read_from_file(self):
        try:
            with open("movies.pkl", "rb") as f:
                self.movies = pickle.load(f)
            with open("users.pkl", "rb") as f:
                self.users = pickle.load(f)

            if self.movies:
                Movie.m_id = self.movies[-1].movie_id + 1
            if self.users:
                User.u_id = self.users[-1].user_id + 1
        except:
            pass

    def write_to_file(self):
        with open("movies.pkl", "wb") as f:
            pickle.dump(self.movies, f)
        with open("users.pkl", "wb") as f:
            pickle.dump(self.users, f)

    def log_in_as_admin(self):
        uid = input("Enter admin id: ")
        pwd = input("Enter admin password: ")

        if uid == "admin" and pwd == "admin123":
            self.admin_functions()
        else:
            print("Invalid admin credentials")

    def admin_functions(self):
        while True:
            print("\n1. Add Movie\n2. Edit Movie\n3. Delete Movie\n4. View All Movies\n5. View Users\n0. Exit")
            ch = input("Enter your choice = ")

            if ch == '1':
                name = input("Enter Movie name = ")
                dur = input("Enter Duration = ")
                screen = int(input("Enter Screen No = "))
                price = float(input("Enter Ticket Price = "))
                show = input("Enter Showtime = ")
                self.movies.append(Movie(name, dur, screen, price, show))
                print(f"{name} Movie added")

            elif ch == '2':
                id = int(input("Enter Movie ID to update = "))
                m = self.find_movie(id)
                if m:
                    while True:
                        print("\nWhat do you want to update?")
                        print("1. Movie Name")
                        print("2. Duration")
                        print("3. Screen Number")
                        print("4. Ticket Price")
                        print("5. Showtime")
                        print("0. Exit Editing")
                        choice = input("Enter your choice = ")

                        if choice == '1':
                            m.movie_name = input("New Movie Name = ")
                        elif choice == '2':
                            m.duration = input("New Duration = ")
                        elif choice == '3':
                            m.screen_number = int(input("New Screen Number = "))
                        elif choice == '4':
                            m.ticket_price = float(input("New Ticket Price = "))
                        elif choice == '5':
                            m.showtime = input("New Showtime = ")
                        elif choice == '0':
                            print("Movie updated.")
                            break
                        else:
                            print("Invalid choice.")
                else:
                    print("\nMovie not found")

            elif ch == '3':
                id = int(input("Enter Movie ID to delete = "))
                m = self.find_movie(id)
                if m:
                    self.movies.remove(m)
                    print("Movie Deleted")
                else:
                    print("Movie not found")

            elif ch == '4':
                for m in self.movies:
                    print("----------------------------------")
                    print(m)
                    print("----------------------------------")

            elif ch == '5':
                for u in self.users:
                    print("===================================")
                    print(u)
                    print("===================================")

            elif ch == '0':
                break
            else:
                print("Invalid choice")

    def register_user(self):
        name = input("Enter the name = ")
        password = input("Enter the password = ")
        self.users.append(User(name, password))
        print(f"Registered successfully. Your User ID is: {self.users[-1].user_id}")

    def log_in_as_booth_assistant(self):
        uid = int(input("Enter your user ID = "))
        pwd = input("Enter your password = ")
        u = self.find_user(uid, pwd)
        if u:
            self.user_functions(u)
        else:
            print("\nInvalid credentials")

    def user_functions(self, user):
        while True:
            print("\n1. View Movies\n2. Book Ticket\n3. View My Bookings\n0. Exit")
            ch = input("Enter your choice = ")

            if ch == '1':
                for m in self.movies:
                    print("----------------------------------")
                    print(m)
                    print("----------------------------------")

            elif ch == '2':
                id = int(input("Enter movie ID = "))
                m = self.find_movie(id)
                if m:
                    qty = int(input("Enter the number of tickets = "))
                    total = qty * m.ticket_price
                    user.bookings.append((m.movie_name, qty, total))
                    print(f"Movie = {m.movie_name}, Quantity = {qty}, Total = ₹{total}")
                    print("\nTicket booked successfully.\n")
                else:
                    print("\nMovie not found")

            elif ch == '3':
                if user.bookings:
                    print("\nYour Bookings:")
                    for b in user.bookings:
                        print("----------------------------------")
                        print(f"Movie = {b[0]}\nTickets = {b[1]}\nTotal = ₹{b[2]}")
                        print("----------------------------------")
                else:
                    print("\nYou have no bookings yet.")

            elif ch == '0':
                break
            else:
                print("\nInvalid choice\n")

    def find_user(self, uid, pwd):
        for u in self.users:
            if u.user_id == uid and u.password == pwd:
                return u
        return None

    def find_movie(self, id):
        for m in self.movies:
            if m.movie_id == id:
                return m
        return None