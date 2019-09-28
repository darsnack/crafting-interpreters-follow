#include <DoublyLinkedList.h>
#include <stdlib.h>

void insertAfter(DoublyLinkedList *list, DoublyLinkedNode *node, DoublyLinkedNode *newNode) {
    newNode->prev = node;
    if (node->next == NULL) {
        newNode->next = NULL;
        list->last = newNode;
    } else {
        newNode->next = node->next;
        node->next->prev = newNode;
    }
    node->next = newNode;
}

void insertBefore(DoublyLinkedList *list, DoublyLinkedNode *node, DoublyLinkedNode *newNode) {
    newNode->next = node;
    if (node->prev == NULL) {
        newNode->prev = NULL;
        list->first = newNode;
    } else {
        newNode->prev = node->prev;
        node->prev->next = newNode;
    }
    node->prev = newNode;
}

void insertFirst(DoublyLinkedList *list, char *data) {
    DoublyLinkedNode *tmp;
    tmp = (DoublyLinkedNode *) malloc(sizeof(DoublyLinkedNode));
    tmp->data = data;

    if (list->first == NULL) {
        tmp->prev = NULL;
        tmp->next = NULL;
        list->first = tmp;
        list->last = tmp;
    } else insertBefore(list, list->first, tmp);
}

void insertLast(DoublyLinkedList *list, char *data) {
    if (list->last == NULL) insertFirst(list, data);
    else {
        DoublyLinkedNode *tmp;
        tmp = (DoublyLinkedNode *) malloc(sizeof(DoublyLinkedNode));
        tmp->data = data;
        insertAfter(list, list->last, tmp);
    }
}