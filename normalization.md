## Database Normalization 
# Step 1: First Normal Form (1NF)

# Rule

- Each table must have a **primary key**.
- No repeating groups or arrays.
- Each cell contains **atomic values** (no multiple values in one field).

### Application

- `user` table → each user identified by `user_id` (UUID). No repeating groups (e.g., phone numbers stored separately if multiple are needed).
- `property` table → each property has `property_id`. Attributes like `name`, `description`, `location`, `price_per_night` are atomic.
- `booking` table → each booking has `booking_id`. Dates and prices are atomic fields.
- `payment`, `review`, and `message` → all have primary keys and atomic fields.

**All tables satisfy 1NF.**

---

# Step 2: Second Normal Form (2NF)

# Rule

- Must already be in 1NF.
- No **partial dependency** (no non-key attribute depends on part of a composite key).

### Application

- None of our tables use composite primary keys (we use `UUID` primary keys).
- For example:
  - In `booking`, `total_price` depends on the whole booking, not just `user_id` or `property_id`.
  - In `review`, `rating` depends on `review_id`, not partially on `property_id` or `user_id`.

**All tables satisfy 2NF.**

---

# Step 3: Third Normal Form (3NF)

# Rule

- Must already be in 2NF.
- No transitive dependency (non-key attributes must not depend on other non-key attributes).

### Application

- `user`:
  - `email` is unique, only depends on `user_id`.
  - No dependency between non-key attributes (e.g., `first_name` does not depend on `role`).
- `property`:
  - `host_id` references `user.user_id`. No redundant storage of host details (name, email, etc.) inside property.
- `booking`:
  - `status` is independent and limited by ENUM. No derived fields (e.g., `duration` is not stored, can be calculated from `start_date` and `end_date`).
- `payment`:
  - Linked to `booking_id`. `status` is ENUM, no redundant user or property info stored.
- `review`:
  - Stores `rating` and `comment`. Reviewer and property info linked via foreign keys, not repeated.
- `message`:
  - Uses `sender_id` and `recipient_id` as foreign keys. No redundant user details stored.

**All tables satisfy 3NF.**

---

## Example of Avoided Redundancy

- **Without normalization**:  
  In `property`, if we stored `host_name` and `host_email`, updating host info would require changes across all properties.

- **With normalization (3NF)**:  
  `property.host_id` references `user.user_id`. Host details are stored once in the `user` table.