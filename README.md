# dbc-capstone
A web-application to help people find safe company home

This project is a mobile-first webapp that allows people to organize into private, invitation-only groups to provide walks for people who need them. The invite-only mechanism contributes to a safer community because each member must be vetted by someone already in it. 

This also sets up another boundary to prevent malicious users from abusing the site because access to core site feature (e.g. the ability to escort someone who requests a walk) are restricted to people who are members of a group. 

One of the core principles of making <this app> work is trust within the internal community. To that end, we're implementing some reporting mechanisms to emphasize safety. Anyone can request a walk, provided they register with a valid email address (or FB authentication). In order to be an approved companion/guardian on a walk, someone must be a member of one of the app's invite-only communities (flock). People are first matched with others in their flock. Those requesting walks who aren't in a flock will be matched with someone from a nearby flock who's proven themselves trustworthy through previous walks, as will people with no available guardian in their own flocks.

After each walk, the person who requested it will receive a short survey asking if their companion made them feel more safe with space to elaborate if not. Each flock will have a moderator and any reports of "no, this person made me feel unsafe" will be immediately sent to the moderator for review.

There are some nifty features around pairing users for walks and how they'll communicate that we'll leave you to discover on your own (or update in a subsequent version of this README doc). Basically, private chats through the service for each walk. 



## User Stores

```
As a visitor to the site, I can register and request another site user walk me to my destination. 
```

```
As a guardian, I'm notified of requested walks by my group or in my area. I can choose to either accept or deny a walk request.
```

```
As a user and guardian paired for a walk, I can enter a secure chat, tied only to my <this app> account, to coordinate a meeting location and time.
```

```
As a user who requests a walk, I can report on whether a companion made me feel safer at the conclusion of that walk.git
```

```
As a group moderator, I can review the walks involving people in my group.

```

```
As a group moderator, guardians who are reported as unsafe are barred from new walks until an admin lifts that restriction.

```

```
As a companion, I can report a user who I feel is unsafe.
```

```
As a companion, I can easily add people I've walked that I trust to one of my groups.
```
```
As a registered user, I can easily view my groups.
```

```
As an unregistered, invited user, I can join a group through an invitation link.
```
