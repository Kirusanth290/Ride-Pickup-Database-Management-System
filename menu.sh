#!/bin/sh

MainMenu() {
while [ "$CHOICE" != "E" ]
do
    clear
    echo "============================================================"
    echo "|                 Ride & Pickup DBMS — Oracle Tool         |"
    echo "============================================================"
    echo
    echo " 1) Drop Tables"
    echo " 2) Create Tables"
    echo " 3) Populate Tables"
    echo " 4) Run Advanced Queries"
    echo " E) Exit"
    echo
    echo "------------------------------------------------------------"
    echo -n "Choose: "
    read CHOICE

    case $CHOICE in
        1) bash drop_tables.sh;       read -p "Press Enter to continue..." ;;
        2) bash create_tables.sh;     read -p "Press Enter to continue..." ;;
        3) bash populate_tables.sh;   read -p "Press Enter to continue..." ;;
        4) bash query_tables.sh;      read -p "Press Enter to continue..." ;;
        E) exit ;;
        *) echo "Invalid option."; sleep 1 ;;
    esac
done
}

ProgramStart() {
    echo "Starting Ride & Pickup DBMS Menu..."
    sleep 1
    MainMenu
}

ProgramStart
