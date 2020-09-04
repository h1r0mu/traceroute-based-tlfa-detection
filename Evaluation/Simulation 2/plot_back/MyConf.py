#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © Takayuki Hirayama <hirayama@sasase.ics.keio.ac.jp>
#
# Distributed under terms of the MIT license.
import os
BASE = os.path.abspath("..")

BIN = BASE + "/bin/"

TOPOLOGY = BASE + "/topology/"
WAXMAN = TOPOLOGY + "waxman/"
BA = TOPOLOGY + "ba/"
WS = TOPOLOGY + "ws/"

NOISE = BASE + "/noise/"
RANDOM_NOISE = NOISE + "random/"
BURST_NOISE = NOISE + "burst/"

ATTACK_FILE = BASE + "/attack_file/"

ENV = BASE + "/env/"
ENV_BA100       = ENV + "/ba100-1/"
ENV_BA1000      = ENV + "/ba1000-1/"
ENV_WAXMAN100   = ENV + "/waxman100-0.2-0.2/"
ENV_WAXMAN1000  = ENV + "/waxman1000-0.2-0.2/"
ENV_CAIDA = ENV + "/caida/"
ENV_CAIDA_X10 = ENV + "/caida_x10/"
ENV_CAIDA_X100 = ENV + "/caida_x100/"
ENV_CAIDA_SHIFT = ENV + "/caida_shift/"
ENV_CAIDA_ORIGINAL = ENV + "/caida_original/"
ENV_CAIDA_DETAIL = ENV + "/caida_detail"
ENV_CAIDA_DETAIL_X10 = ENV + "/caida_detail_x10"
ENV_CAIDA_DETAIL_X100 = ENV + "/caida_detail_x100"

BA100 = "ba100"
BA1000 = "ba1000"
WAXMAN100 = "waxman100"
WAXMAN1000 = "waxman1000"
CAIDA = "caida"
CAIDA_X10 = "caida_x10"
CAIDA_X100 = "caida_x100"
CAIDA_SHIFT = "caida_shift"
CAIDA_ORIGINAL = "caida_original"
CAIDA_DETAIL = "caida_detail"
CAIDA_DETAIL_X10 = "caida_detail_x10"
CAIDA_DETAIL_X100 = "caida_detail_x100"

TEMP = BASE + "/temp/"
