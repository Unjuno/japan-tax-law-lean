# Unit review — 災害被害者租税減免法施行政令 附則第二条 table EXCEPTION

Normative unit id: `NORM|483362ae8efa29996e865140eaba318b1901fc6c2e58af0a10161d9ec7695684`

Law: 322CO0000000268 (災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令), **CabinetOrder (政令)**. SHA-256 f6fe1c93…a66a21c.

Verbatim source text (injected from the queue, not hand-typed): 「東北海運局長（山形県又は秋田県の区域に係る処分等又は申請等に係る場合を除く。）」

Exact source position: `LawBody[34]/SupplProvision/SupplProvision[2]/Article:2/Article#2/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1` — a table cell in a supplementary provision.

Norm kind: **EXCEPTION** — the table cell defines 東北海運局長 (Tohoku Maritime Transport Bureau Director) with an exception: cases concerning dispositions or applications relating to the areas of 山形県 or 秋田県 are excluded. Computable slice: the prefecture-based exclusion flag. All statutory terms derived programmatically from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Cases relating to the areas of 山形県 or 秋田県 are excepted; other regions are not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for DisasterTaxReliefOrderSupplArt2HokkaidoBureauException.lean. |
| D | PASS — transcription audit 529/529. |
| C | Only the prefecture-based exclusion flag is modeled. The substantive disposition/application procedures, the rest of the table, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefOrderSupplArt2HokkaidoBureauException.lean` — `Region` (firstPrefecture/secondPrefecture/other), `isExcluded` (true/true/false), three boundary theorems.
- Independent spec: `SpecExcluded` Prop disjunction, representationally distinct; `agree_first`/`agree_other` axiom-free (rfl, left/right, rcases).
- Build: full lake build success (1747 jobs); all seven unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive disposition/application procedures, rest of the table, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ORDER_SUPPL_ART2_HOKKAIDO_BUREAU_EXCEPTION.md`.
