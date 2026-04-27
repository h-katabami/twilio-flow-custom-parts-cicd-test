import json
import os


GUIDANCE_BY_USE_CASE = {
    "password_reset": "パスワード再設定のご案内です。サポート担当者から折り返します。",
    "account_lock": "アカウントロック解除のご案内です。本人確認後に解除を進めます。",
    "general": "お問い合わせを受け付けました。担当部署からご連絡します。",
}


def _resolve_guidance(use_case: str) -> str:
    return GUIDANCE_BY_USE_CASE.get(use_case, GUIDANCE_BY_USE_CASE["general"])


def lambda_handler(event, context):
    company = event.get("company", "unknown")
    use_case = event.get("use_case", "general")

    response = {
        "company": company,
        "use_case": use_case,
        "guidance": _resolve_guidance(use_case),
        "scenario_name": os.environ.get("SCENARIO_NAME", "cicd-test"),
    }

    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(response, ensure_ascii=False),
    }