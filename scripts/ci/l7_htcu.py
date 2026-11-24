"""Deterministic H/T/D/C/U tuples for L7 candidates (Objective §5)."""
RULE_HTCU = {
    "PAREN.UNBALANCED": (
        "H: an unmatched bracket/quote is a real transcription defect in the pinned snapshot",
        "T: re-run rules.all_findings on the pinned law and compare offsets at path:line",
        "C: the bracket/quote may legitimately span an article or table boundary",
        "U: candidate only; no human legal review and no defect claim",
    ),
    "REF.ARTICLE.MISSING": (
        "H: the referenced article number does not exist in the pinned revision",
        "T: re-run the reference resolver on law_id and look up the target article",
        "C: the reference may target a repealed or not-yet-enforced article",
        "U: historical/enforcement versions are not resolved here; candidate only",
    ),
    "REF.ARTICLE.DELETED": (
        "H: the reference targets an article marked deleted in this revision",
        "T: re-run the reference resolver and check the target article's Delete flag",
        "C: 附則 may intentionally refer to a deleted provision (経過措置)",
        "U: historical effect is not judged; candidate only",
    ),
    "REF.PARA.MISSING": (
        "H: the referenced paragraph number does not exist in the target article",
        "T: re-run the paragraph resolver on the target article",
        "C: numbering may differ across enforcement versions",
        "U: no cross-version pin; candidate only",
    ),
    "REF.ITEM.MISSING": (
        "H: the referenced item number does not exist in the target paragraph",
        "T: re-run the item resolver on the target paragraph",
        "C: 号 may be in 枝番号 or a different 項",
        "U: fine-grained numbering not fully resolved; candidate only",
    ),
    "REF.SUPP.MISSING": (
        "H: the referenced supplementary provision does not exist",
        "T: re-run the 附則 resolver on the target law",
        "C: the reference may target a different amendment's 附則",
        "U: amendment history not pinned; candidate only",
    ),
}


def htcu(rule_id: str, review_status: str) -> tuple[str, str, str, str, str]:
    h, t, c, u = RULE_HTCU.get(rule_id, (
        "H: this rule's finding is a real anomaly in the pinned snapshot",
        "T: re-run rules.all_findings on the pinned law at path:line",
        "C: an alternative reading of the same text may be valid",
        "U: candidate only; no human legal review",
    ))
    d = "UNRESOLVED" if review_status == "unreviewed" else f"HUMAN_{review_status.upper()}"
    return h, t, d, c, u
