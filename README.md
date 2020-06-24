# Programming Ebook (Flutter Project)

Programming Ebook Collections Application (Bloc Pattern)


Project Structure
--------

     * lib
         * models        ( for collection of data)
         * constraints   ( for common data values)
         * services      ( for network or local database repositories)
         * widgets       ( for common widget eg. validators, customwidget..)
         * utils         (for other logic functions)
         * screens       ( Each Page)
         * home > blocs, local_widget, home_screen.dart (like that)
       
      * app.dart    ( root widget is MaterialApp or CapitinoApp , theme, locate,..)
      * main.dart   ( App Launch main widget)
      * routes.dart ( Navigtion Page management System)
  
    
    
 ** Bloc Pattern (Bussicness Logic Componment)
 Reference Link   https://blog.usejournal.com/flutter-http-requests-with-dio-rxdart-and-bloc-da325ca5fe33
 ----
 
 *** Features
 1. Themes change (Dark Mode, Light Mode)          <=>   ( Using Provider )
 2. Multiple Languge Support (Myanmar,English)     <=>   ( Using Localization with json file)
 3. Data Source from Post man mock api             <=>   ( Using Bloc, rxdrt, dio )
 ----
  
Screenshoot
--------
  <img alt="English Unicdoe Choose" src="https://github.com/dev-mgkaung/Knowledge-NoteList/blob/gh-page/maxresdefault.jpg" width=1200 height=850 />
  
  <img alt="Screen Shot 1" src="https://github.com/dev-mgkaung/Knowledge-NoteList/blob/gh-page/one.jpg" width=210 height=450 />  <img alt="English Unicdoe Choose" src="https://github.com/dev-mgkaung/Knowledge-NoteList/blob/gh-page/two.jpg" width=210 height=450 /> <img alt="Screen Shot 1" src="https://github.com/dev-mgkaung/Knowledge-NoteList/blob/gh-page/three.jpg" width=210 height=450 />  <img alt="English Unicdoe Choose" src="https://github.com/dev-mgkaung/Knowledge-NoteList/blob/gh-page/five.jpg" width=210 height=450 />

