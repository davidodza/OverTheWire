/*
This program is for cracking a simple substitution cipher with frequency analysis
Krypton Level 2 ? Level 3 (http://overthewire.org/wargames/krypton/krypton3.html)

Plan
1) Compare every three letter string with all other three letter strings
2) Frequency analysis of three letter strings
*/

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <iterator>
#include <algorithm>   
using namespace std;

class tripFreq {
public:
	string trip;
	int freq;

	tripFreq(string _trip, int _freq) {
		trip = _trip;
		freq = _freq;
	}
};

bool largerTrips(tripFreq* t1, tripFreq* t2) {
	return (t1->freq < t2->freq);
}

int main() {
	vector <tripFreq*> allTrips;
	tripFreq* trip;

	ofstream myfile;
	myfile.open ("analysisTrips.txt");
	ifstream file("ciphertxtTrips.txt");

	//store the ciphertext as a string
	string temp;
	string fullCipherTxt;
	while(getline(file, temp)) {		
		fullCipherTxt += temp;
	}

	int count = 0;
	int checkNew = 0;
	for (int b = 0; b < fullCipherTxt.length() - 2; b++) {
		checkNew = 0;
		count = 0;
		string test(1, fullCipherTxt[b]);
		test += fullCipherTxt[b+1];
		test += fullCipherTxt[b+2];	

		for (int i = 0; i < allTrips.size(); i++) {

			if (allTrips.at(i)->trip == test) {
				checkNew = 1; //Stop processing if the triple already exists in the vector
			}
		}

		if (checkNew == 0) {
			for (int a = 0; a < fullCipherTxt.length() - 2; a++) {
				string triplet(1, fullCipherTxt[a]);
				triplet += fullCipherTxt[a+1];
				triplet += fullCipherTxt[a+2];
				//count the occurences of the triple
				if (test==triplet) {		
					count++;
				}
			}
			trip = new tripFreq(test, count);
			allTrips.push_back(trip);
		}
		//doing nothing if the triple was already in the vector
	}

	sort(allTrips.begin(), allTrips.end(), largerTrips); //sort vector from highest to lowest occurences
	for (int i = 0; i < allTrips.size(); i++) {
		myfile << "trip: " << allTrips.at(i)->trip << ", count: " << allTrips.at(i)->freq <<endl;
	}

	cin >> temp;

	return 0;

}

/* Some output
trip: DQF, count: 12
trip: BXJ, count: 13
trip: UYS, count: 13
trip: SWQ, count: 13
trip: SWC, count: 13
trip: YSQ, count: 13
trip: SUQ, count: 13
trip: QNS, count: 13
trip: UDQ, count: 14
trip: JCB, count: 14
trip: SUY, count: 14
trip: JDQ, count: 15
trip: CBG, count: 15
trip: CGE, count: 16
trip: JSN, count: 16
trip: SNS, count: 19
trip: DCU, count: 19
trip: DSN, count: 22
trip: SQN, count: 23
trip: QGW, count: 27
trip: JDS, count: 61
*/
