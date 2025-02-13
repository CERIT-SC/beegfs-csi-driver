# BeeGFS CSI Driver Compatibility

The goal for the BeeGFS CSI driver is to maintain compatibility with relevant
versions of Kubernetes as well as relevant version of BeeGFS. With this goal in
mind the following notes are the guidelines we use when planning for changes to
version compatibility and testing.

***

## Contents

* [Kubernetes](#kubernetes)
* [BeeGFS](#beegfs)
* [OpenShift](#openshift)
* [Nomad](#nomad)

***

## Kubernetes

The BeeGFS CSI driver will generally support the set of Kubernetes releases
supported by the Kubernetes project itself at the time of the driver release.
Information about Kubernetes release support status can be found on the
[Kubernetes releases](https://kubernetes.io/releases/) page.

Occasionally, a particular Kubernetes patch version may be required to 
guarantee smooth driver operation. See the [Troubleshooting 
Guide](docs/troubleshooting.md) for known issues.

### Supporting New Kubernetes Releases

The criteria for including a new Kubernetes release, meaning a new Kubernetes
minor version, for compatibility testing is the following: It is able to be set
up via a released version of
[Kubespray](https://github.com/kubernetes-sigs/kubespray) (used to maintain
BeeGFS CSI driver test environments).

### Dropping Compatibility Support For Old Kubernetes Releases

Kubernetes versions that become unsupported during the development cycle of a
new BeeGFS CSI driver version will be considered for removal from the
compatibility testing matrix. We make a "best effort" to maintain compatibility
with one out-of-support version as an acknowledgement that Kubernetes has a 
fast moving release cycle and upgrading environments can take time. However,
if any issues arise when using the driver on a Kubernetes version that is
out of support, the first recommendation is to upgrade Kubernetes.

***

## BeeGFS

The BeeGFS CSI driver primarily interacts with the BeeGFS client and so the
version of the client is the focus of our compatibility testing. Testing BeeGFS
client and server compatibility directly is outside the scope of the BeeGFS CSI
driver testing. Therefore, unless explicitly noted otherwise, the identification
of a BeeGFS version should be interpreted as an environment where all BeeGFS
components (client and server) are running the same specified version.

For guidance on compatibility between BeeGFS clients and servers refer to 
the [BeeGFS documentation](https://doc.beegfs.io/latest/index.html)

### BeeGFS Version Support

Our primary commitment is to support the latest two minor versions of 
BeeGFS. 

When a new version of BeeGFS is released we will include support for the new
BeeGFS version once the following criteria is met.
* We have integrated the BeeGFS version in our testing environment
* All testing is passing on the new BeeGFS version
* Any required development work has been completed

When a new BeeGFS version is included for support we will drop testing and
support for the older BeeGFS version that was supported by the last release of
the BeeGFS driver.


***

## OpenShift

A new version of the driver and the operator that can be used to deploy 
and/or upgrade the driver will be tested on the latest supported version of 
OpenShift.

***

## Nomad

While we have made [initial investments](deploy/nomad/README.md) into enabling 
the use of the BeeGFS CSI driver with HashiCorp Nomad, we may not test with 
Nomad for every driver release and do not currently consider Nomad to be a 
supported container orchestrator.