
# SkyGrubRailsServer Project Overview

## Project Description
SkyGrubRailsServer is an ambitious project aimed at replicating the functionality of popular food delivery services like UberEats, tailored for the unique needs of the small town of Big Sky. The project's primary goal is to establish a robust, user-friendly platform that connects local restaurants with customers, facilitating convenient and efficient food ordering and delivery services.

## Objectives
- **Enhance Local Food Accessibility:** By bringing multiple restaurants onto a single platform, we aim to make diverse culinary options more accessible to Big Sky residents.
- **Support Local Businesses:** The platform will serve as a digital storefront for local restaurants, helping them reach a wider customer base without the overhead of a physical expansion.
- **Streamline Food Delivery:** Implement a seamless ordering and delivery system that optimizes routes and delivery times, ensuring a high level of customer satisfaction.

## Key Features
- **Comprehensive Restaurant Listing:** Users can browse through a variety of local restaurants, viewing menus and placing orders directly through the platform.
- **Real-time Order Tracking:** Customers can track their orders from the moment they are placed until they are delivered to their doorstep.
- **Partner Performance Metrics:** The platform will track and analyze the performance of delivery partners, ensuring consistent quality of service.
- **Flexible Payment Options:** Supports multiple payment methods for user convenience.

## Technical Overview
- **Ruby on Rails Backend:** The server-side logic is built on Ruby on Rails, ensuring a scalable, secure, and efficient application.
- **Geolocation Services:** Utilizes geolocation to optimize delivery routes and provide real-time tracking.
- **Database Management:** Robust database schema to handle user data, restaurant menus, orders, and delivery tracking efficiently.

## Business Impact
This project is not just a technological endeavor but also a community-focused initiative aimed at bolstering the local economy of Big Sky by modernizing the food delivery landscape.

## Entity-Relationship Diagram (ERD)
For a detailed understanding of the database schema and relationships, please refer to the ERD provided in this file: [ERD.pdf](./erd.pdf)


## SkyGrub Order Lifecycle Management System

### Introduction
SkyGrub is a food delivery platform that connects users with partner restaurants and delivery partners. This README.md file provides a detailed explanation of the codebase, including the database schema, models, and key functions for managing orders.

### Database Schema
The database schema consists of the following tables:
- **User:** Represents a user, either a customer or a partner.
- **Restaurant:** Represents a restaurant.
- **MenuItem:** Represents a menu item offered by a restaurant.
- **OrderItem:** Represents an individual item in an order.
- **Order:** Represents an order placed by a customer.
- **PartnerOrders:** Represents the assignment of an order to a partner.assigned to a partner.
  
### Models
The following models are defined in the codebase:
- **User:** Represents a user, either a customer or a partner.
- **Restaurant:** Represents a restaurant.
- **MenuItem:** Represents a menu item offered by a restaurant.
- **OrderItem:** Represents an individual item in an order.
- **Order:** Represents an order placed by a customer.
- **PartnerAssignment:** Represents the assignment of an order to a partner.

*Note: This document is a high-level overview and may evolve as the project progresses.*