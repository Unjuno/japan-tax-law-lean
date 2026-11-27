"""Structural audit toolkit for Japanese statutes (e-Gov standard format).

Scope (R1): 所得税法 (Act 340AC0000000033, rev 340AC0000000033_20261001_507AC0000000070)
and 所得税法施行令 (Cabinet Order 340CO0000000096, rev 340CO0000000096_20260522_508CO0000000093),
as in force on 2026-11-15.

Design rule: the auditor never asserts that a reference is an error in the
law. Unresolved references are classified as "unresolved candidate" and require
human review. Model defects and legal defects are tracked separately.
"""

__version__ = "1.0.0"

from . import kansuji
