typedef struct DoublyLinkedNode {
    struct DoublyLinkedNode *prev;
    struct DoublyLinkedNode *next;
    char *data;
} DoublyLinkedNode;

typedef struct DoublyLinkedList {
    DoublyLinkedNode *first;
    DoublyLinkedNode *last;
} DoublyLinkedList;

void insertFirst(DoublyLinkedList *list, char *data);
void insertLast(DoublyLinkedList *list, char *data);