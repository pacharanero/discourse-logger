# discourse_logger

simple command line app which uses Discourse API to append posts to a single topic in a Discourse Forum.
I use it to quickly send a line of text to a changelog/work tracker topic on a Discourse forum I use
you specify the URL of the Discourse forum, the user API key and username, and the topic_id to post to in the environment variable file

You can get an API key from your User page in Discourse (Admin only, but if you aren't an admin you could ask if the admin will allow you to have a key, it's only the same as being able to post through the webapp as you)
You can see the topic_id at the end of the URL when viewing the **first** post of the topic in the web view (it's the number after the `/` after the topic slug)

# Usage
* install discourse API gem:
`gem install discourse_api` (sudo needed before gem command if you aren't using RVM)

* get the code:
```
$ git clone <repo_URL>
$ cd discourse_logger
```

* edit blank_env.sh, adding your <Discourse URL>, <your API key>, <your username> and the <topic ID> of the topic you want to append to.

* if you are using version control (eg Git) then it's **essential** to rename the new environment variable file to something like live_env.sh and ensure this is in your .gitignore so that the credentials don't end up being committed to GitHub!

* initialise the environment variables:
`source yourenv.sh`

* run the program:
```
ruby discourse_logger.rb "your text here which will be appended to the topic"
=> Logged: 'your text here which will be appended to the topic' to topic ID xxx
```
 
* I then aliased these commands in /etc/profile so that it would be a shorter commmand to type each time:
`sudo nano /etc/profile`

* add this line anywhere (usually near the top is favourite):
`alias disclog="source path/to/your/live_env.sh && ruby path/to/your/discourse_logger.rb"`

* *Ctrl-O* to save; *Ctrl-X* to exit

* activate the change:
`source /etc/profile`

* now you can append to the Discourse topic with:
```
disclog "your text here which will be appended to the topic"
=> Logged: 'your text here which will be appended to the topic' to topic ID xxx
```
