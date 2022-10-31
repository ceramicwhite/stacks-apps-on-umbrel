## Stacks Community App Store for Umbrel

### Add the Stacks Appstore to your Umbrel

- Open the Appstore from your Umbrel Dashboard
- Click the three dots in the top right and select *Community App Store*
- Paste https://github.com/ceramicwhite/stacks-apps-on-umbrel.git and click ADD
- Click Open and install desired Stacks apps


https://user-images.githubusercontent.com/10330103/197889452-e5cd7e96-3233-4a09-b475-94b754adc7a3.mp4


Alternatively, you can use the Umbrel CLI as described below.

To add the Stacks app store:
```
sudo ~/umbrel/scripts/repo add https://github.com/ceramicwhite/stacks-apps-on-umbrel.git

sudo ~/umbrel/scripts/repo update
```

To install an app from the Stacks app store
```
sudo ~/umbrel/scripts/app install stacks-blockchain
```

To remove the Stacks app store:
```
sudo ~/umbrel/scripts/repo remove https://github.com/ceramicwhite/stacks-apps-on-umbrel.git
```
