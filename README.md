# Arbiters Design and Verification


##  What is an Arbiter?
An **arbiter** is a hardware module used in digital systems to **control access to a shared resource** among multiple requesters. It ensures that requests are handled fairly and efficiently, preventing conflicts when multiple components (e.g., processors, memory controllers, buses) request access at the same time.

Arbiters are widely used in **synchronous bus architectures, memory controllers, and FPGA designs** where multiple entities compete for access to a single resource.

---
### **1. Fixed Priority Arbiter**
A **Fixed Priority Arbiter** assigns a **predefined priority** to each requester. When multiple requests arrive at the same time, the highest-priority request is **always granted access first**, even if lower-priority requests have been waiting longer.
#### **Pros:**
✅ Simple to implement  
✅ Guarantees fast access for high-priority requests  
#### **Cons:**
❌Starvation issue – Lower-priority requests may be delayed indefinitely  
---

### **2. Round Robin Arbiter**
A **Round Robin Arbiter** grants requests in a **rotational order**, ensuring fairness. If multiple requests arrive, the arbiter serves them **one at a time, moving sequentially** to the next requester after each grant.
#### **Pros:**
✅ Ensures fairness – Every request gets served eventually  
✅ Avoids starvation  
#### **Cons:**
❌ Can have slightly higher latency compared to a fixed priority scheme  
