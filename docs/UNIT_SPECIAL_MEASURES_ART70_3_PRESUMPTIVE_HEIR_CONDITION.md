# Unit review — 租税特別措置法 第七十条の三(3) 第1号 ロ PRESUMPTION

Normative unit id: `NORM|d775175c5fdefe03cb113c17eb692261fc30ceac82464eae2afd408b64095615`

Law: 332AC0000000026 (租税特別措置法), Act. SHA-256 `e6e6013b…c8d5ee`.

Verbatim source text (injected from the queue, not hand-typed): 「住宅取得等資金の贈与をした者の直系卑属である推定相続人（孫を含む。）であること。」

Exact source position: `LawBody[3]/MainProvision/MainProvision[3]/Article:70_3/Article#70_3/Paragraph#3/Item#1/Subitem1#2/Subitem1Sentence/Sentence#1` — article flat length 6672 with needle.

Norm kind: **PRESUMPTION** — a new norm kind for this level of detail.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The presumptive lineal descendant qualifies; other statuses do not; a grandchild is included. |
| T | `scripts/ci/transcription_audit.py` article-kind check for SpecialMeasuresArt70_3PresumptiveHeirCondition.lean. |
| D | PASS — transcription audit 468/468. |
| C | Only heir-status discrimination and grandchild-inclusion flag modeled; substantive tax consequences out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/SpecialMeasuresArt70_3PresumptiveHeirCondition.lean` — `HeirStatus` (presumptiveLinealDescendant/other), `includesGrandchild=true`, `isQualifiedHeir`, boundary theorems.
- Independent spec: `SpecPresumption` Prop conjunction, representationally distinct; `implementation_satisfies_spec` axiom-free (`And.intro`/rfl).
- Build: full lake build success (1528 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive tax consequences, donor details, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_SPECIAL_MEASURES_ART70_3_PRESUMPTIVE_HEIR_CONDITION.md`.
