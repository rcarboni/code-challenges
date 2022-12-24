// run ./cin_cout < input.txt
#include <iostream>
#include <string>
using namespace std;

long long d, n, t, x, y;
string a, b;
int main()
{
	// ios::sync_with_stdio(0);
	// cin.tie(0);
	for(cin >> t; t--;)
	{
        cout << "t is " << t << endl;
		cin >> n >> x >> y >> a >> b;
        cout << "N is: " << n << endl;
        cout << "x and y " << x << " " << y << endl;
    }
}