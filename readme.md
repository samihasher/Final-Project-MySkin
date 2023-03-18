# York University Full Stack Final Project
## FS1000

**About MySkin web application**

This web application is designed for skincare enthusiasts who want to keep track of their skincare routine, monitor the expiry dates of their products and track which products work for their skin. Skincare products can be overwhelming, confusing and difficult to track effectiveness. MySkin tackles these challenges head-on with an easy to use and accessible web application. You can now easily track which products work for you and which products break you out, ultimately saving you time and money!

The web app allows users to create an account where users can build a customized routine that caters to their skincare needs and track the products they use. Users can easily swap products in their routine at anytime and can easily track any skin reactions caused by each product. As an added feature, the app allows users to set reminders for when to repurchase products or when to throw them out after they have expired. This ensures that users are always using fresh, effective products that are safe for their skin.

Overall, MySkin is an essential tool for anyone looking to improve their skincare routine, discover new products, and achieve healthy, glowing skin.

**User Stories**

**User**
* As a user, I want to comment on a product that broke me out so that I can refer back to it to not purchase again
* As a user, I want to track the expiry dates of my products so that I know when to throw it out
* As a user, I want to see the history of which face masks I have used so that I can purchase again
* As a user, I want to swap out a product I use in my routine so that I can have glowy skin

**Admin**
* As an admin, I want to approve and publish skincare routines so that users can have inspiration for their own routines and expereince better skin health
* As an admin, I want to collect feedback on the tracker so that the website can improve
* As an admin, I want to update update the database so the tracker is autofilling information like brands and product names

**Figma Desing link**

* Figma Link (https://www.figma.com/file/OwtktAvKyT0vFTXuiNegFo/Main-pages---Final-Project?node-id=0%3A1&t=XdvpJvIGsUe54nj7-1)

**Entity Relationship Model**
**Mission Statement of Database:**
The purpose of the MySkin database is to track skincare routines and product experiences for users to develop their skincare routine.

**Mission Objective**
* Track skincare products usage
* Build a skincare routine
* Review and document skincare products and experiences
* Swap out old products for new ones

**Entity Relationship Model:**
Entities:
* User (infinite)
* Routine (two types)
* Products
* Brands
* Reviews

* Users may have one or more routines, Routines must belong to one and only one user
* Routines must contain one or more product, products must be added to one or more routines
* Products must have one and only one brand, brands may have one or more products
* Products may have one and only one review, reviews must belong to one and only one product

* Relational Model:**
User(**user_ID**, password, email_address)
Routines(**routine_ID**, userID(fk), routine_type, routine_name, routine description)
Product(**product_ID**, brandID(fk), product_name, product_type, product_imagetype)
Review(**review_ID**, productID(fk), userID(fk), review_rating, review_description)
Brand(**brand_ID**, brand_name, brand_image)


![AssignmentFS1030 drawio (2)](https://user-images.githubusercontent.com/122646965/226135435-0bb9f5a2-03ab-49db-bb16-ce3ac092504e.png)
