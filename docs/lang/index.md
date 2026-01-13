# InfraSonar Expression language

In InfraSonar, most conditions leverage a powerful, custom expression language to test your data. We specifically designed this language for its flexibility.

A key advantage over a purely graphical interface is the ability to embed comments directly within your expressions. This means you can thoroughly explain the rationale behind specific tests, significantly improving readability and maintainability for your team.

Despite its power, we've kept the language simple and robust, ensuring a gentle learning curve. Its built-in data type checking actively helps prevent common mistakes, making your expressions more reliable.

!!! info "InfraSonar Copilot"
    For conditions utilizing expressions, InfraSonar automatically attempts to generate a **Root Cause Analysis (RCA)** when an alert triggers. This allows you to engage with the Copilot to diagnose and resolve the issue faster.

    The RCA service does not receive customer-specific data (such as IP addresses). To ensure privacy, only the alert template and expression syntax are transmitted for analysis.

    If you prefer not to send specific alerts to the RCA Service, you can disable this feature by adding the following comment anywhere within your condition:
    ```javascript
    // INFRASONAR_NO_RCA
    ```


