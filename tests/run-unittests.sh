# Script to prepare the environment and run the test. Is invoked by run-unittests.ps1
FILTER=$1
echo "filter=$FILTER"
cd /pwd && \
pip install -r requirements-dev.txt && \
pip install -r requirements.txt && \
python3 -m unittest -v tests/test_$FILTER.py