#include <iterator>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <math.h> 
#include <algorithm>    // std::sort
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
	ofstream myfile;
	vector <tripFreq*> allTrips;
	tripFreq* trip;
	myfile.open ("analysis.txt");
	std::ifstream file("ciphertxt.txt");
	std::string temp;
	std::string fullCipherTxt;
	while(std::getline(file, temp)) {
		//Do with temp
		fullCipherTxt += temp;
	}

	for (int a = 0; a++; a < fullCipherTxt.length() - 3) {

	}

	/*string test = fullCipherTxt[0] + fullCipherTxt[1] + fullCipherTxt[2];
	string test(1, fullCipherTxt[0]);
	test += fullCipherTxt[1];
	test += fullCipherTxt[2];
	cout << test <<endl;
	*/
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
				checkNew = 1; //checkNew == 1 if the triple already exists in the vector
			}
		}

		if (checkNew == 0) {
			for (int a = 0; a < fullCipherTxt.length() - 2; a++) {
				string triplet(1, fullCipherTxt[a]);
				triplet += fullCipherTxt[a+1];
				triplet += fullCipherTxt[a+2];

				if (test==triplet) {		
					count++;
				}
			}
			trip = new tripFreq(test, count);
			allTrips.push_back(trip);
		}
		//doing nothing if the triple was already in the vector
	}
	//trip = new tripFreq(test, count);


	std::sort(allTrips.begin(), allTrips.end(), largerTrips);
	for (int i = 0; i < allTrips.size(); i++) {
		myfile << "trip: " << allTrips.at(i)->trip << ", count: " << allTrips.at(i)->freq <<endl;
	}

	cout << count <<endl;
	cout << fullCipherTxt.length();
	cout << fullCipherTxt[0];
	cin >> temp;

	return 0;

}
