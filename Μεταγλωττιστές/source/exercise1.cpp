#include <iostream>
#include <ctime>

using namespace std;

int d = 0;
const int MAXD = 3;

void K();

void Z() {
    cout << "Z -> (K)\n";
    cout << "(";
    d++;
    K();
    cout << ")";
    d--;
}

void G() {
    if (d < MAXD && rand() % 2 == 0) {
        cout << "G -> Z\n";
        Z();
    } else {
        cout << "G -> a\n";
        cout << "a";
    }
}

void M() {
    int r = rand() % 3;

    if (d < MAXD && r == 0) {
        cout << "M -> -K\n";
        cout << "-";
        K();
    }
    else if (d < MAXD && r == 1) {
        cout << "M -> +K\n";
        cout << "+";
        K();
    }
    else {
        cout << "M -> ε\n";
    }
}

void K() {
    cout << "K -> G M\n";
    G();
    M();
}

int main() {
    srand(time(0));

    cout << "Βήματα παραγωγής:\n";
    cout << "-----------------\n";

    Z();

    cout << "\n-----------------\n";
    cout << "Τελική συμβολοσειρά παράχθηκε παραπάνω.\n";

    return 0;
}