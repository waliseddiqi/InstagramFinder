# instagramfinder

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

I used Instagram public API for fetching users profile. 
The API data consist of users fullname, followers count, following count,  shared posts(if not private) and some other minor information. 
I added 3 main pages in app HomePage, SearchPage and History Page
Homepage is basically users fetched information page that displays users profile and post.
SearchPage is the first page that user sees when opening app. In SearchPage user can type a Instagram username. 
HistoryPage shows searched users as a list form. 



I used Dio for fetching data from API. I have also created a data model for fetched JSON data. 
Most of the time I am using Http but Dio has very easy way of caching data with DioCache Manager. 
I use caching to keep fetched data in cache for one day as default. 
And when there is no internet connection searching for cached data works really well.




For architecture of the App I used Stacked package that is build over top of Provider and it is easy to use and manage for small projects. 
But for bigger project I prefer Provider because it is more flexiable.
FutureViewModel is build over top of ChangeNotifier class but it has some nice interface of handling API calls.
BaseViewModel is exactly the same as ChangeNotifier but it has some parameters that can be useful like hasError or IsBusy.

I used SharedPreferences for saving data locally and use it for HistoryPage. 


I was only able to run the app in android device and emulators. I have tested the UI responsive in different device using Device Preview package





