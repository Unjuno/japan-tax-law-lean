# Evidence reference repair (machine-generated log)

H: a cited review section supports the unit's module; an evidence hash matches the committed blob.

T: re-extract all `## * review` sections, resolve each Batch citation, recompute SHA-256 (LF-normalised), compare with attestation.

D: first measured on a 73-unit ledger: 54 unresolved (51 false Batch-P citations + 3 unattested hashes). Parallel evidence work reduced the ledger; the final repair on the current 9-unit ledger re-pointed 7 remaining false Batch-P citations to sections that actually name the module and marked 3 unattested hashes NOT_RECORDED. Final measurement: 41/41 references resolved, 0 unresolved.

C: re-pointing assumes the named review section genuinely covers the module; the review text itself is not re-adjudicated here.

U: this is reference resolution only; no proof, legal-correctness or human-review claim.

| unit | axis | from | to | module | target section |
|---|---|---|---|---|---|
| `NORM|008f8fdeb18548b26d46cf73190a1d665d17705f0b229e0cc10ef7fab5e056da` | adversarial_review | Batch P | Batch O | LocalGrantRevenueBase | Batch O review (2026-11-19) |
| `NORM|01bc5d0ea84e476f03587df6fefe7b5d0069de50a81e0b28bc26e8be03771418` | adversarial_review | Batch P | Batch O | LocalAddedValueStandard | Batch O review (2026-11-19) |
| `NORM|2bb1ca3263f7e9d5364bf3f9a4f429da2445559f7f9cfbabfaf5db5e5d2a3b31` | adversarial_review | Batch P | Batch R | IncomeArt205Withholding | Batch R review (2026-11-19) |
| `NORM|3620a145620f245bddac3a73257ed1f73e79567f8bf40778f940d81803cc31d8` | adversarial_review | Batch P | Batch N | PublicPensionWithholding | Batch N review (2026-11-19) |
| `NORM|84f30566e583de635fc2da0096497d579f38dd9935595a55259fd024a6e24c0f` | adversarial_review | Batch P | Batch O | LocalGrantRevenueBase | Batch O review (2026-11-19) |
| `NORM|a7607acfb60e7e06f14829cc3971438828d4385f88056dbb56552bfc12746785` | adversarial_review | Batch P | Batch M | LocalTaxMedicalIncomeRatio | Batch M review (2026-11-18) |
| `NORM|ac371ade261bbd9d8681252eb9998c1991cc66b0773a70cd8b45389690aecb6f` | adversarial_review | Batch P | Batch O | LocalAddedValueStandard | Batch O review (2026-11-19) |
