### PowerDevelopmentTaxPenalty.lean — 電源開発促進税法 art.12(4)

- **pin**: law `349AC0000000079`, article 12(4).
- **独立再抽出**: 原文の needle 照合で「三倍」という誤読を排除し、`上限 = max(五十万円, 相当金額)` を確認。独立仕様と全称定理 `agreeUpper` で照合。
- **H/T/D**: 境界 499,999/500,000/500,001/1,000,000 PASS。
- **C/U**: 犯罪成立要件・情状による科刑は NOT MODELLED。人間レビュー `LEGAL_REVIEW_PENDING`。

---

### TwoOrMorePortMunicipalities.lean — 特別とん譲与税法施行規則 第二条（二以上の開港所在市町村）

独立再抽出（一次資料 `data/raw/332M50000002021_20010106_412M50000008044.law.json`）。raw bytes = 6395、SHA-256（CRLF→LF）= `2ce4744265b50bdb5b62c0380575ca4b73fc7c92ee7f5125b97f74a90b384c7c`（INVENTORY と大小文字違いのみ一致）、revision = `332M50000002021_20010106_412M50000008044`、`CurrentEnforced`。逐語 needle 「（二以上の開港所在市町村の区域が一の税関の管轄区域に属する場合の譲与の基準）」は全局 1 回、第二条 scoped（364 文字）内に存在、MAIN provision（ArticleCaption）。禁止トークン 0、spec 独立（`specMinimumPorts` 独自定数＋補集合否定、impl 定義非再利用）、spec literal 2（二）は原文に逐語存在、境界カテゴリ = {zero, small_input, threshold_below, threshold_at, threshold_above, saturation}、example 12、普遍定理 `agree_at_least_two (ports : Nat)`。**判定: PASS**（転記・符号化にブロッキング欠陥なし）。

**H/T/D/C/U** の詳細記録は `docs/adversarial/reviews-two-or-more-port-municipalities.md` を参照。H = 誤値・off-by-one・過剰包含の反証可能性、T = 上記実測コマンド、D = PASS（実測値付き）、C = 見出し条件のみをモデル化し譲与の基準は対象外、U = F-1（本文の別ユニット必要）／カーネル実行は CI attestation 待ち。

法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。
