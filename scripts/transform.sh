sudo zip -d cct.zip fare_rules.txt
sudo zip -d cct.zip fare_attributes.txt
sudo zip -d marta.zip fare_attributes.txt
sudo zip -d grta.zip fare_attributes.txt
sudo zip -d grta.zip fare_rules.txt
sudo zip -d gct.zip fare_attributes.txt
sudo zip -d gct.zip fare_rules.txt

echo '---------- Transforming CCT ----------'

# CCT
sudo java -jar ~/repos/learnyougtfs/transformer/onebusaway-gtfs-transformer-cli-1.3.3.jar \
--transform=/var/otp/graphs/transform/cct.json \
cct.zip cct.zip

echo '---------- Transforming GRTA ----------'

# GRTA
sudo java -jar ~/repos/learnyougtfs/transformer/onebusaway-gtfs-transformer-cli-1.3.3.jar \
--transform=/var/otp/graphs/transform/grta.json \
grta.zip grta.zip

echo '---------- Transforming MARTA ----------'

# MARTA
sudo java -jar ~/repos/learnyougtfs/transformer/onebusaway-gtfs-transformer-cli-1.3.3.jar \
--transform=/var/otp/graphs/transform/marta.json \
/Users/landon/Dropbox/data/marta/google_transit.zip marta.zip

echo '---------- Transforming GCT ----------'

# GCT
sudo java -jar ~/repos/learnyougtfs/transformer/onebusaway-gtfs-transformer-cli-1.3.3.jar \
--transform=/var/otp/graphs/transform/gct.json \
gct.zip gct.zip

# GCT Simplify calendar
sudo java -jar ~/repos/learnyougtfs/transformer/onebusaway-gtfs-transformer-cli-1.3.3.jar \
--transform='{"op":"calendar_simplification"}' \
gct.zip gct.zip

echo '---------- Transforming Streetcar ----------'

# sudo java -jar ~/repos/learnyougtfs/transformer/onebusaway-gtfs-transformer-cli-1.3.3.jar \
# --transform=/var/otp/graphs/transform/streetcar.json \
# streetcar.zip streetcar.zip
