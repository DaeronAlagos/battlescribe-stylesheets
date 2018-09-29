#!/bin/bash

gulp clean-dist && gulp clean-build && gulp inject-campaign && gulp xsl-campaign && gulp rename-campaign && gulp inject-matched-play && gulp xsl-matched-play && gulp rename-matched-play
