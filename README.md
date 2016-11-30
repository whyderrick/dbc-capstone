# dbc-capstone

[![Build Status](https://travis-ci.org/whyderrick/dbc-capstone.svg?branch=development)](https://travis-ci.org/whyderrick/dbc-capstone)

A web-application to help people find safe company home

This project is a mobile-first webapp that allows people to organize into private, invitation-only groups to provide walks for people who need them. The invite-only mechanism contributes to a safer community because each member must be vetted by someone already in it. 

This also sets up another boundary to prevent malicious users from abusing the site because access to core site feature (e.g. the ability to escort someone who requests a walk) are restricted to people who are members of a group. 

One of the core principles of making <this app> work is trust within the internal community. To that end, we're implementing some reporting mechanisms to emphasize safety. Anyone can request a walk, provided they register with a valid email address (or FB authentication). In order to be an approved companion/guardian on a walk, someone must be a member of one of the app's invite-only communities (flock). People are first matched with others in their flock. Those requesting walks who aren't in a flock will be matched with someone from a nearby flock who's proven themselves trustworthy through previous walks, as will people with no available guardian in their own flocks.

After each walk, the person who requested it will receive a short survey asking if their companion made them feel more safe with space to elaborate if not. Each flock will have a moderator and any reports of "no, this person made me feel unsafe" will be immediately sent to the moderator for review.

There are some nifty features around pairing users for walks and how they'll communicate that we'll leave you to discover on your own (or update in a subsequent version of this README doc). Basically, private chats through the service for each walk. 
