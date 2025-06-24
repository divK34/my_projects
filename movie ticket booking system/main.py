from movie_ticket_mgt_sys import ManagementSystem

ms = ManagementSystem()
ms.read_from_file()

while True:
    print("\n1. Log in as Admin\n2. Log in as Booth Assistant\n3. User Registration\n0. Exit.\n")
    ch = int(input("Enter your choice = "))

    if ch == 1:
        ms.log_in_as_admin()
    elif ch == 2:
        ms.log_in_as_booth_assistant()
    elif ch == 3:
        ms.register_user()
    elif ch == 0:
        ms.write_to_file()
        print("\nData saved. Thank You!\n")
        break
    else:
        print("\nIncorrect choice!\n")