# Platform

The InfraSonar cloud platform is hosted on the [Google Cloud Platform](https://cloud.google.com/).

Data from a monitored environment is received and processed in the InfraSonar cloud platform on what we call the Hubs. These Hubs evaluate the data against configured conditions and store received time series data in [SiriDB](https://siridb.net/). Received state data is kept in memory by the Hubs.

<figure markdown>
  ![High level overview](../images/infrasonar_highlevel.png){ width="500"}
  <figcaption>Architectural overview of the InfraSonar platform</figcaption>
</figure>
