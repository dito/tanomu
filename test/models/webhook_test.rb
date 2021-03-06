require File.expand_path '../../test_helper.rb', __FILE__

class WebhookTest < MiniTest::Test
  def test_run_with_unsupported_event
    Events::IssueComment.any_instance.expects(:hook).never
    Events::PullRequest.any_instance.expects(:hook).never

    Webhook.run(event_type: nil, payload: {})
    Webhook.run(event_type: 'create', payload: {})
  end

  def test_run_with_supported_event
    Events::PullRequest.any_instance.expects(:hook)
    Webhook.run(event_type: 'pull_request', payload: {})

    Events::IssueComment.any_instance.expects(:hook)
    Webhook.run(event_type: 'issue_comment', payload: {})
  end
end
