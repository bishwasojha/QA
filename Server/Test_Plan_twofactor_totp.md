## Twofactor TOTP Test Plan



| Test Case                                | Expected Result                          | Result         | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | --------------- |
| Enable the app.                          | No problems found.                       | :construction: |                 |
| Using a non admin user user1, enable totp in the personal settings.<br />Having the app freeotp (android or ios) scan the QR code provided and set it up.<br />Login using user1, get a new code in the freeotp app. Introduce it in the login view. Login. | User1 can login without problems.        | 🚧             |                 |
| Using a non admin user user1, enable totp in the personal settings.<br />Having the app freeotp (android or ios) scan the QR code provided and set it up.<br />Try to login with user1 using his password. When the totp input appears introduce random numbers, emojis, negative numbers and empty string. | User1 cannot login in any of this situations. | 🚧             |                 |
| Using a LDAP user ldap_user, enable totp in the personal settings.<br />Having the app freeotp (android or ios) scan the QR code provided and set it up.<br />Login using ldap_user, get a new code in the freeotp app. Introduce it in the login view. Login. | User_ldap can login without problems.    | 🚧             |                 |
| Using a non admin user user1, enable totp in the personal settings.<br />Having the app google authenticator (android or ios) scan the QR code provided and set it up.<br />Login using user1, get a new code in the google authenticator app. Introduce it in the login view. Login. | User1 can login without problems.        | 🚧             |                 |
| **Browsers**                             |                                          |                |                 |
| Check the login process is possible using chrome |                                          | 🚧             |                 |
| Check the login process is possible using firefox |                                          | 🚧             |                 |
| Check the login process is possible using edge |                                          | 🚧             | <br />          |
| Check the login process is possible using safari |                                          | 🚧             |                 |
| **Special cases**                        |                                          |                |                 |
| Having a server using shibboleth. <br /><br />Using a non admin user myself, enable totp in the personal settings.<br />Having the app freeotp (android or ios) scan the QR code provided and set it up.<br />Login using myself, get a new code in the freeotp app. Introduce it in the login view. Login. |                                          | 🚧             |                 |