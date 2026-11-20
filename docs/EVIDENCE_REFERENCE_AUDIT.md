# Evidence reference audit (machine-generated)

Do not hand-edit. Regenerate with `scripts/ci/audit_evidence_references.py`.

A document name in an evidence string is not proof that the document
supports the unit. This audit resolves each reference against the artifact.

- units checked: 59
- references resolved: 283/288
- references UNRESOLVED: 5
- all-complete claimable from references: False

| unit | axis | D | detail |
|---|---|---|---|
| `NORM|167b8cabf184adb` | implementation | FAIL | sha256 MISMATCH |
| `NORM|167b8cabf184adb` | independent_spec | FAIL | sha256 MISMATCH |
| `NORM|167b8cabf184adb` | tests | FAIL | sha256 MISMATCH |
| `NORM|9090b882bace49e` | adversarial_review | FAIL | module=PerCapitaEqualRate section_chars=0 |
| `NORM|9090b882bace49e` | kernel_proof | FAIL | run=44707322412 attested_run=44684783591 conclusion=success |
