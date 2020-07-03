# Programming Ebook (Flutter Project)

Programming Ebook Collections Application (Bloc Pattern)

Are You looking source code for production level or large project or bloc pattern sample code? 
Sure , this is best practise sample code for flutter beginner. (Project structure is simply and easy to maintain)
I suggest for you . You need to learn Bloc pattern . Sorry My english is not good.
Let me say this project is not complete . I always add new code , new feature by daily to complete project.

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
         * assets        ( Resource folder for image, svg, logo )
         * resources     ( Resource file for language eg. eng.json, my.json, ch.json)
         
      * app.dart    ( root widget is MaterialApp or CapitinoApp , theme, locate,..)
      * main.dart   ( App Launch main widget)
      * routes.dart ( Navigtion Page management System)
  
  
 ** Basic Logic
 
    If you know android knowledge , we define Activity is Page and Fragment is Screen.
    eg. Our app have two page. Login Page and Home Page. So. Navigator route system pass form LoginPage to HomePage.
      HomePage have four Screen .(like fragment HomeFragment,NotificationFragment...and so on)
      ## Note that this rule only for my project structure. I dont know other people how to define for it.
      ------
  
    
    
 ** Bloc Pattern (Bussicness Logic Componment)
 Reference Link   https://blog.usejournal.com/flutter-http-requests-with-dio-rxdart-and-bloc-da325ca5fe33
 ----
 
 *** Features
 1. Themes change (Dark Mode, Light Mode)                                     <=>   ( Using Provider )
 2. Multiple Languge Support (Myanmar,English)                                <=>   ( Using Localization with json file)
 3. Data Source from (Post man mock, JsonServer, Github page) api             <=>   ( Using Flutter Bloc, rxdrt, dio )
 4. Shipping Address and Payment Card list(db)                                <=>   ( Using Sqflite - local database)
 5. Eidt Profile (choose image, and then crop with compress imagesize)        <=>   (Using imagepicker , image cropper, image compresser)
 6. AboutDialog (with phone call, visit website)                              <=>   ( Using url launcher) 


--------
  <img alt="English Unicdoe Choose" src="https://github.com/dev-mgkaung/Knowledge-NoteList/blob/gh-page/maxresdefault.jpg" width=1000 height=650 />
  
  <img alt="Screen Shot 1" src="https://github.com/dev-mgkaung/Knowledge-NoteList/blob/gh-page/one.jpg" width=210 height=450 />  <img alt="English Unicdoe Choose" src="https://github.com/dev-mgkaung/Knowledge-NoteList/blob/gh-page/two.jpg" width=210 height=450 /> <img alt="Screen Shot 1" src="https://github.com/dev-mgkaung/Knowledge-NoteList/blob/gh-page/three.jpg" width=210 height=450 />  <img alt="English Unicdoe Choose" src="https://github.com/dev-mgkaung/Knowledge-NoteList/blob/gh-page/five.jpg" width=210 height=450 />

