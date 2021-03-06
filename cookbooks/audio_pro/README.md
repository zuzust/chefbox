# audio_pro Cookbook

This cookbook installs a selected set of audio pro solutions.
The following recipes may apply:

- `audio_pro::default`    - purges unselected packages and includes recipes as nedeed.
- `audio_pro::ardour`     - installs __Ardour digital audio workstation__ and suggested packages.
- `audio_pro::audacity`   - installs __Audacity audio editor__ and suggested packages.
- `audio_pro::guitarix`   - installs __Guitarix rock guitar amplifier for Jack__ and suggested packages.
- `audio_pro::hydrogen`   - installs __Hydrogen drum machine/step sequencer__ and suggested packages.
- `audio_pro::idjc`       - installs __Internet DJ Console shoutcast/icecast client__ and suggested packages.
- `audio_pro::mixxx`      - installs __Mixxx digital DJ interface__ and suggested packages.
- `audio_pro::muse`       - installs __Muse audio/MIDI sequencer__ and suggested packages.
- `audio_pro::musescore`  - installs __Musescore score editor__ and suggested packages.
- `audio_pro::rosegarden` - installs __Rosegarden music editor and MIDI/audio sequencer__ and suggested packages.
- `audio_pro::transcribe` - installs __Transcribe! software to work out music from recordings__ and suggested packages.
- `audio_pro::traverso`   - installs __Traverso multitrack audio recorder and editor__ and suggested packages.
- `audio_pro::tuxguitar`  - installs __TuxGuitar multitrack guitar tablature editor and player__ and suggested packages.


## Requirements

This cookbook applies to the following platforms:  
- `Linux Mint 17+`
- `Ubuntu 14.04+`

#### cookbooks
- `core`

#### recipes
- `core::default`

#### packages
- `qjackctl` - User interface for controlling the JACK sound server


## Usage

#### audio_pro::default
Just include `audio_pro` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[audio_pro]"
  ]
}
```


## Contact

By Email:   carles.ml.dev at gmail dot com  
On Twitter: [@zuzudev](https://twitter.com/zuzudev)  
On Google+: [Carles Muiños](https://plus.google.com/109480759201585988691)


## License

Copyright (c) 2013,2014 Carles Muiños

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

