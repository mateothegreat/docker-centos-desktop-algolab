# docker-centos-desktop-algolab


## AlgoLab User Directory
Each container user has a persistent directory for maintaining settings & state.

    ```
    $ gcloud compute disks create \
                algolab-user-alglab111 \
                --description "Persistent home directory for AlgoLab Desktop Application." \
                --size 10 \
                --image algolab-user-template
    ```

0. Create a new disk from the image above:

    ```
    $ gcloud compute disks create \
                algolab-user-alglab111 \
                --description "Persistent home directory for AlgoLab Desktop Application." \
                --size 10
    ```
    Deleting a disk: `gcloud compute images delete algolab-user-image -q`
    
0. Attach new disk to a running VM:

    ```
    $ gcloud compute instances attach-disk gke-algolab-cluster-1-default-pool-65c33910-9q5l --disk algolab-user-alglab111
    ```

0. Format new disk
    
    ```
    $ sudo mkfs.ext4 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/disk/by-id/google-persistent-disk-2
    
        mke2fs 1.42.9 (28-Dec-2013)
        Discarding device blocks: done
        Filesystem label=
        OS type: Linux
        Block size=4096 (log=2)
        Fragment size=4096 (log=2)
        Stride=0 blocks, Stripe width=0 blocks
        32768000 inodes, 131072000 blocks
        6553600 blocks (5.00%) reserved for the super user
        First data block=0
        Maximum filesystem blocks=2279604224
        4000 block groups
        32768 blocks per group, 32768 fragments per group
        8192 inodes per group
        Superblock backups stored on blocks:
                32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
                4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
                102400000
    
        Allocating group tables: done
        Writing inode tables: done
        Creating journal (32768 blocks): done
        Writing superblocks and filesystem accounting information: done
    
    ```
0. Mount disk and update file(s)/directory(s):
    
    ```
    # mount -o discard,defaults /dev/disk/by-id/google-persistent-disk-2 /home/alglab111
    # ls -la /home/alglab111/
    total 24
    drwxr-xr-x. 3 root root  4096 Jan 19 19:30 .
    drwxr-xr-x. 9 root root  4096 Jan 19 19:32 ..
    drwx------. 2 root root 16384 Jan 19 19:30 lost+found
    ```

0. Detach disk:

    ```
    $ gcloud compute instances  detach-disk \
                                gke-algolab-cluster-1-default-pool-65c33910-9q5l2 \
                                --disk algolab-user-alglab111
    ```

## Create a new persistent disk for a user
Now that we have a stock/standard image created with some default files we can create new disks for individual users.

    ```
    $ gcloud compute disks delete algolab-user-alglab111 -q
    $ gcloud compute disks create \
                algolab-user-alglab333 \
                --description "Persistent directory for AlgoLab Desktop Application." \
                --size 10 \
                --image algolab-user-image
    
    NAME                    ZONE           SIZE_GB  TYPE         STATUS
    algolab-user-alglab111  us-central1-c  10       pd-standard  READY
    
    ```


## Updating the AlgoLabLinux64.zip file
Each time a container is built (aka "image") it pulls the latest AlgoLabLinux64.zip file from the storage bucket <https://console.cloud.google.com/storage/browser/algolab-container-resources/?project=virtualmachines-154415>.

## Triggering a new container image build
Containers are compiled (built) into an "image". When new containers are launched they pull the latest image from
the image server. When changes are made the image needs to be rebuilt. This happens automatically when changes are pushed
up to the source code repository. To invoke a new build you can run this command in a terminal:

```

curl -H "Content-Type: application/json" \
        --data '{"build": true}' \
        -X POST \
        https://registry.hub.docker.com/u/appsoa/docker-centos-desktop-algolab/trigger/bf24566c-d29e-4138-93f2-0d4beb5170f9/

```

You can also invoke a build via the UI at <https://hub.docker.com/r/appsoa/docker-centos-desktop-algolab/~/settings/automated-builds/>.
You can view the status of builds by going to <https://hub.docker.com/r/appsoa/docker-centos-desktop-algolab/builds/>.
