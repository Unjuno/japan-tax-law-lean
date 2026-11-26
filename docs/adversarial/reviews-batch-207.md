# Adversarial review — batch 207

Mechanical (not human) re-extraction and cross-check of DocumentAgeSixMonthCap
against the pinned source. Reproducible from committed bytes; NOT a human legal
review. No approval field recorded; legal review stays LEGAL_REVIEW_PENDING.

### DocumentAgeSixMonthCap.lean — 国外送金等調書提出法律施行規則 第四条 第四項 第三号 ハ

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 内国税の適正な課税の確保を図るための国外送金等に係る調書の提出等
  に関する法律施行規則 (law 409M50000040096), revision
  409M50000040096_20250401_507M60000040027.
- Source: data/raw/409M50000040096_20250401_507M60000040027.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=4`, `Paragraph#4`,
  `Item#3`, `Subitem1#3 (ハ)`; pinned full unit leaf occurs once in the scoped
  article (5,443 chars). The shorter substring 「六月以内に作成されたもの」
  occurs six times across sibling subitems; only the FULL leaf (including the
  exclusions) uniquely identifies this cell. Sibling article 3 lacks it.
- 数値: 「六」 = 6 (`matched_spellings({6}) == {'6':['六']}`);
  `clause_correspondence({6}, full leaf, …)` True.
- 期限: two-sided recency predicate `created <= presentation ∧
  presentation <= created + 6` (months). Kernel-decided boundaries:
  0→5 true, 0→6 true, 0→7 false, 5→10 true, 4→10 true, 3→10 false;
  future document 11→10 false.
- 独立仕様: specLookback/specFresh are independent; agree* use `rw`/`rfl`.
- 判定 (H/T/D/C/U): H（官公署書類のうち提示日前六月以内に作成されたもの）,
  T（6, 六, bytes pinned）, D（rfl / decide）, C（full-leaf 一意、sibling negative、
  two-sided 境界、spec 独立性）, U（イ・ロ書類、除外書類の列挙、有効期間のある
  書類の提示日有効性、暦日計算、他条・他法令は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
