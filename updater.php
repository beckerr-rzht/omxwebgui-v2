<?php
/**
 * A simple command line update script to update to latest stable release
 */

passthru("cd ". __DIR__ ." && git pull");
