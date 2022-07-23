# Introduction

It is a telecommunication network that allows digital devices to exchange data using wired/wireless connections to share hardware/software resources.

# Data Communication

## Components

-   **Message**: information to be communicated.
-   **Sender**: device that sends data.
-   **Medium**: physical path through which message travels from sender to receiver.
-   **Protocol**: set of rules that govern data communication.

## Effectiveness

-   **Delivery**: sending data to correct destination.
-   **Accuracy**: sending data without error.
-   **Timeliness**: sending data in a timely manner.
-   **Jitter**: uneven delay between packets, eg. audio video synchronization

## Reliability

Reliability means lossless delivery of data. Acknowledgements are sent by receiver to sender to tell frames have been received safely. Failing to do so will make the sender re-send the frames.

## Types of Communications

### Transmission Mode

<table>
    <thead>
        <tr>
            <th>Simplex</th>
            <th>Half-Duplex</th>
            <th>Full-Duplex</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Unidirectional always.</td>
            <td>Bidirectional but one at a time.</td>
            <td>Bidirectional always.</td>
        </tr>
        <tr>
            <td>Sender and receiver have fixed role.</td>
            <td>Sender and receiver can swap but one at a time.</td>
            <td>Sender and receiver can be anyone.</td>
        </tr>
        <tr>
            <td>Full bandwidth to communication channel.</td>
            <td>Full bandwidth to communication channel.</td>
            <td>Bandwidth is divided between two half-duplex channels.</td>
        </tr>
        <tr>
            <td>Eg. radio.</td>
            <td>Eg. Walkie-talkie</td>
            <td>Eg. Telephone</td>
        </tr>
    </tbody>
</table>

### Inter-device Connection

<table>
    <thead>
        <tr>
            <th>Point to Point</th>
            <th>Multi-point</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Consists of two devices.</td>
            <td>Multiple devices present.</td>
        </tr>
        <tr>
            <td>Devices are connected via a dedicated link.</td>
            <td>Link is shared among all devices.</td>
        </tr>
        <tr>
            <td>More secure and private.</td>
            <td>Higher security and privacy risk.</td>
        </tr>
    </tbody>
</table>

Multi-point communication can be of two types,

-   **Broadcasting**: data is sent to all devices on network.

-   **Multi-casting**: data is sent only to a set of devices.

### Service and Delivery

<table>
    <thead>
        <tr>
            <th colspan="2">Connection-less</th>
            <th>Connection-oriented</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">No connection is established in advance or released afterwards.</td>
            <td>There are three phases including connection establishment, transmission and connection release.</td>
        </tr>
        <tr>
            <td colspan="2">Packets follow any route.</td>
            <td>All packets follow same path.</td>
        </tr>
        <tr>
            <td colspan="2">Packets can be sent and received in any order.</td>
            <td>Packets are sent and received sequentially.</td>
        </tr>
        <tr>
            <th>Unacknowledged</th>
            <th>Acknowledged</th>
            <td>Always acknowledged.</td>
        </tr>
        <tr>
            <td>Not reliable.</td>
            <td>Reliable.</td>
            <td>Reliable.</td>
        </tr>
        <tr>
            <td>Analogous to postal service.</td>
            <td>Used in optic fibres.</td>
            <td>Analogous to telephone service.</td>
        </tr>
    </tbody>
</table>

## Scale

<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Range</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Personal Area Network (PAN)</td>
            <td>Square Meter</td>
        </tr>
        <tr>
            <td rowspan="3">Local Area Network (LAN)</td>
            <td>Room</td>
        </tr>
        <tr>
            <td>Building</td>
        </tr>
        <tr>
            <td>Campus</td>
        </tr>
        <tr>
            <td>Metropolitan Area Network (PAN)</td>
            <td>City</td>
        </tr>
        <tr>
            <td rowspan="2">Wide Area Network (LAN)</td>
            <td>Country</td>
        </tr>
        <tr>
            <td>Continent</td>
        </tr>
        <tr>
            <td>Internet</td>
            <td>Planet</td>
        </tr>
    </tbody>
</table>

# Network Topologies

It is the geometric representation of the relationship between all the links and devices to one another.

<table>
    <thead>
        <tr>
            <th>Physical Topology</th>
            <th>Logical Topology</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Physical layout of the devices and cabling.</td>
            <td>The path along which data travels from one point to another</td>
        </tr>
        <tr>
            <td>It is actual route concerned with transmission.</td>
            <td>It is a high level representation of data flow.</td>
        </tr>
    </tbody>
</table>

![Network Topologies](./images/network-topologies.png)

## Mesh Topology

All devices have a point to point link to every other device. It is like a complete graph.

We need $\frac{n \times (n - 1)}{2}$ or ${n \choose 2}$ duplex links where $n$ is the number of nodes.

### Advantages

Due to point to point communication there are many advantages:

-   No traffic problem even in multi-device setup.

-   Failure of one link does not break entire system.

-   Higher privacy and security.

-   Fault detection is easier.

### Disadvantages

Excessive number of links cause the following problems:

-   Difficult installation and reconnection.

-   More hardware and space required.

-   Expensive.

-   Only viable in small networks.

## Star Topology

Each device has a point to point link to a central hub. The central controller relays the data received from source to destination acting as the articulation point.

Used in systems where data is required to be processed or read before transmission.

Number of links are $n$ itself where $n$ are the number of devices.

### Advantages

-   Better performance as need to pass through lesser nodes.

-   Cheaper than mesh topology.

-   Easy to install and configure.

-   Failure of one link does not break entire system.

-   Fault detection is easier.

### Disadvantages

-   Dependency on central hub. If hub goes down then system fails.

-   More cabling is required in comparison to some other topologies.

-   Difficult to use for very large networks.

## Bus Topology

One long cable known as bus acts as backbone of the network to which each device is connected directly (multi-point connection).

Devices are connected to the bus via drop lines and taps,

-   **Drop Line**: connection wire between the device and main cable.

-   **Tap**: connector between the drop line and bus.

## Advantages

-   Easy installation and extension.

-   Uses less cabling than mesh and star topologies.

-   Cheaper than other topologies.

-   Easy identification of faults.

## Disadvantages

-   Performance degrades as network is extended due to shared bandwidth which limits the number of devices that can be connected.

-   Any fault in bus breaks all communication.

-   Single shared medium which may lead to traffic issues and collisions.

## Ring Topology

Point to point connection between each adjacent device forming a ring.

Data is transmitted in a single direction (clockwise/anti-clockwise) otherwise collisions will occur. This may lead to a long path causing the signal to weaken hence repeaters are used. A dual ring could be used to send data in both directions.

## Advantages

-   Easy to install and configure.

-   Fault isolation is easy.

-   No need of central server.

## Disadvantage

-   Break in ring (like disabled station) can break the network.

-   Very less secure as data passes through each device.

# OSI Model

It is a concept that allows two devices to communicate regardless of their architecture.

It is not a protocol but a principle which is very flexible, eg. TCP/IP suite is based on the OSI model philosophy.

## Layered Architecture

The OSI model constitutes of 7 ordered layers.

<table>
    <tbody>
        <tr>
            <td rowspan="3">
                <div>Software Layers</div>
                <div>Responsibility of Host</div>
            </td>
            <td>Application</td>
        </tr>
        <tr>
            <td>Presentation</td>
        </tr>
        <tr>
            <td>Presentation</td>
        </tr>
        <tr>
            <td>Interface</td>
            <td>Transport</td>
        </tr>
        <tr>
            <td rowspan="3">
                <div>Hardware Layers</div>
                <div>Responsibility of Network</div>
            </td>
            <td>Network</td>
        </tr>
        <tr>
            <td>Data Link</td>
        </tr>
        <tr>
            <td>Physical</td>
        </tr>
    </tbody>
</table>

### Communication Process

Headers are metadata containing information like protocol, addresses etc.

-   **Sending**: the data travels from the top to bottom with each layer adding its own headers to the information given by upper layer and forwards it to the lower layer. The data link layer also adds a trailer.

-   **Transmission**: once reaching the physical layer (actual transmission) the data may be read by intermediate nodes like routers/repeaters up to hardware layers for information like addressing.

-   **Receiving**: the data travels from bottom to top having its header stripped at each layer.

The protocols should be defined as such that each layers operates independently of the processing done by other layers caring only about its own headers hence called peer to peer protocols.

![OSI Model Layers](./images/comm-interfaces-in-osi-model.png)

---

**(1) NEED TO RECHECK START**

---

## Physical Layer

The physical interface for transmission of data. Includes all electrical and mechanical aspects of communication.

## Data Link Layer

Responsible for,

-   **Framing**: dividing stream of bits into manageable units called frames.

-   **Physical Addressing**: adds MAC addresses to header.

-   **Access Control**: specifies instructions for accessing a shared network to prevent traffic problems.

-   **Flow Control**: controls rate at which data is transferred to prevent data loss or overwhelming the receiver.

-   **Error Control**: adds reliability to physical layer by adding a trailer to the end of frame.

## Network Layer

Responsible for,

-   **Routing**: finding the most optimal path.

-   **Logical Addressing**: identifying network on which device resides on.

-   **Congestion**: prevents network congestion.

-   **Fragmentation**: defines how to divide a packets into smaller packets to accommodate different media.

## Transport Layer

Responsible for,

-   **Reliability**: checking if data units are error free, delivered in sequence, no loss or have duplication.

-   **Service Type**: Provides connection-less or connection-oriented service.

## Session Layer

-   **Session Management**: defines the start, control end ending of conversations or sessions.

-   **Authentication**: checks for authentication and authorization.

-   **Dialogue Discipline**: provides service for full duplex or half duplex communication.

-   **Check-pointing**: if failure occurs between checkpoints, data can be re-transmitted from last checkpoint.

## Presentation layer

It defines the format in which data is exchanged. Also handles data compression and encryption.

## Application Layer

Interacts directly with application programs to provide common services like file transfer, remote login, sending mails etc. Some protocols include HTTP(S), FTP, DNS, DHCP, SMTP, etc.

---

**(1) NEED TO RECHECK END**

---
