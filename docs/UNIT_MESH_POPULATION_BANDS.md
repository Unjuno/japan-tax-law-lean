# Normative units — 337M50000008017 附則19の14の3(5)（メッシュ人口七区分）

14 units from the pinned revision `337M50000008017_20260724_508M60000008092`,
Article 19-14-3(5) table sentences 39–45, in two parallel series:

| series | labels | source subject |
|---|---|---|
| P (都道府県) | e2..e8 | 当該都道府県の区域内の市町村におけるメツシユ人口 |
| M (市町村) | e2..e8 | 当該市町村におけるメツシユ人口 |

Band ranges (identical in both series):
`[100,200) [200,300) [300,400) [400,500) [500,1000) [1000,2000) [2000,4000)`.

| id | content |
|---|---|
| H | The seven rows partition mesh population d over `100 <= d < 4000`: lower-inclusive 「以上」, upper-exclusive 「未満」. The two series share the same band structure; kernel theorem `cross_scope_inBand` records this cross-scope identity. |
| T | `lake build JapanTaxLaw.MeshPopulationBandsTests`; `python scripts/ci/source_audit_mesh_bands.py` |
| D | Kernel `pickVal_inBand` (exhaustive for 100 <= d < 4000), `unique_band`, `pairwise_exclusive`, `cross_scope_inBand/PickVal`, spec agreement; all 14 originals verbatim (4/4 checks, 14/14 hits). |
| C | Competing readings rejected: 「未満」 as 「以下」 overlaps at each boundary; treating the last band e8 as open-ended wrongly covers d >= 4000 (domain explicitly bounded). The two series' different subjects do not change the band structure. |
| U | d is a caller-established Nat mesh population; the 総務大臣 notice, the weight computation, and the rest of article 19-14-3 are NOT MODELLED. `d < 100` and `d >= 4000` are NOT MODELLED. Human legal review pending. |

Finite index (seven), universally quantified d within the recorded domain — not a finite-domain check.
