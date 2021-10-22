# LaunchDarkly ColdBox Example

This is an example repo of how to use LaunchDarkly CFML SDK with ColdBox.  To try it out, clone the repo, grab CommandBox CLI and run 
```bash
box install
box server start
```

By default, LaunchDarklyl will load static data from the file `/config/flag-data.json`.  If you have your own LD account, place your `SDKKey` in an `.env` file (assumes you are using `commandbox-dotenv` and change `atasource.type` in the `/config/Coldbox.cfc` to be "default" instead of "fileData" and the app will start looking for the flags in your account instaed of the JSON file.

## Users

The site has 3 users  you can test in using the links on the home page 
* Anonymous user (not logged in)
* Logged in as Brad (has special experimental features activated)
* Logged in as Luis (has special welcome message)

The `/handlers/Main.cfc` has a very simply login mechanism that sets session variables.  In the `/config/Coldbox.cfc` you can see this simple callback that tells LaunchDarkly who the logged in user is.

```js
userProvider : ()=>{
	if( session.keyExists( 'user' ) ) {
		return {
			key : session.user.id,
			name : session.user.name,
			role : session.user.role,
			email : session.user.email
		};
	} else {
		// Anonymous
		return {};
	}
}
```

## Segments

There is a single user segment in the JSON called `vip-users` which consists of all users with a `ROLE` of `admin`.  The Luis user is the only user with an admin role.

## Flags

The following flags are defined in the JSON:

### `activate-cool`
When enabled, this boolean flag will change the default image on the home page.  Edit line 25 of `/config/flag-data.json` from 
```js
"on": false,
```
to
```js
"on": true,
```
and refresh the page to enable the flag.

### `welcome-message`

This is a string flag which provides the welcome message displayed on the home page.  This flag serves a different variation for the `vip-users` segment.  CLick the "Login as Luis" link to see the custom message only VIP users see.  

### `experimental-features`

This flag is a JSON type which returns complex data.  The rule serves the "stable" variation by default, but is targed at the user Brad to serve the "bleeding edge" variation instead.  CLick the "Login as Brad" link to see the experimental features activate.  The home page also shows the variation index and the reason provided for why the variation was chosen below the CFDump.