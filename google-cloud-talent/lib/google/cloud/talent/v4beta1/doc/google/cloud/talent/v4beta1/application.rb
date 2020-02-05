# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module Google
  module Cloud
    module Talent
      module V4beta1
        # Resource that represents a job application record of a candidate.
        # @!attribute [rw] name
        #   @return [String]
        #     Required during application update.
        #
        #     Resource name assigned to an application by the API.
        #
        #     The format is
        #     "projects/{project_id}/tenants/{tenant_id}/profiles/{profile_id}/applications/{application_id}".
        #     For example, "projects/foo/tenants/bar/profiles/baz/applications/qux".
        # @!attribute [rw] external_id
        #   @return [String]
        #     Required. Client side application identifier, used to uniquely identify the
        #     application.
        #
        #     The maximum number of allowed characters is 255.
        # @!attribute [rw] profile
        #   @return [String]
        #     Output only. Resource name of the candidate of this application.
        #
        #     The format is
        #     "projects/{project_id}/tenants/{tenant_id}/profiles/{profile_id}".
        #     For example, "projects/foo/tenants/bar/profiles/baz".
        # @!attribute [rw] job
        #   @return [String]
        #     One of either a job or a company is required.
        #
        #     Resource name of the job which the candidate applied for.
        #
        #     The format is
        #     "projects/{project_id}/tenants/{tenant_id}/jobs/{job_id}". For example,
        #     "projects/foo/tenants/bar/jobs/baz".
        # @!attribute [rw] company
        #   @return [String]
        #     One of either a job or a company is required.
        #
        #     Resource name of the company which the candidate applied for.
        #
        #     The format is
        #     "projects/{project_id}/tenants/{tenant_id}/companies/{company_id}".
        #     For example, "projects/foo/tenants/bar/companies/baz".
        # @!attribute [rw] application_date
        #   @return [Google::Type::Date]
        #     The application date.
        # @!attribute [rw] stage
        #   @return [Google::Cloud::Talent::V4beta1::Application::ApplicationStage]
        #     Required. What is the most recent stage of the application (that is, new, screen,
        #     send cv, hired, finished work)?  This field is intentionally not
        #     comprehensive of every possible status, but instead, represents statuses
        #     that would be used to indicate to the ML models good / bad matches.
        # @!attribute [rw] state
        #   @return [Google::Cloud::Talent::V4beta1::Application::ApplicationState]
        #     The application state.
        # @!attribute [rw] interviews
        #   @return [Array<Google::Cloud::Talent::V4beta1::Interview>]
        #     All interviews (screen, onsite, and so on) conducted as part of this
        #     application (includes details such as user conducting the interview,
        #     timestamp, feedback, and so on).
        # @!attribute [rw] referral
        #   @return [Google::Protobuf::BoolValue]
        #     If the candidate is referred by a employee.
        # @!attribute [rw] create_time
        #   @return [Google::Protobuf::Timestamp]
        #     Required. Reflects the time that the application was created.
        # @!attribute [rw] update_time
        #   @return [Google::Protobuf::Timestamp]
        #     The last update timestamp.
        # @!attribute [rw] outcome_notes
        #   @return [String]
        #     Free text reason behind the recruitement outcome (for example, reason for
        #     withdraw / reject, reason for an unsuccessful finish, and so on).
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] outcome
        #   @return [Google::Cloud::Talent::V4beta1::Outcome]
        #     Outcome positiveness shows how positive the outcome is.
        # @!attribute [rw] is_match
        #   @return [Google::Protobuf::BoolValue]
        #     Output only. Indicates whether this job application is a match to
        #     application related filters. This value is only applicable in profile
        #     search response.
        # @!attribute [rw] job_title_snippet
        #   @return [String]
        #     Output only. Job title snippet shows how the job title is related to a
        #     search query. It's empty if the job title isn't related to the search
        #     query.
        class Application
          # The stage of the application.
          module ApplicationStage
            # Default value.
            APPLICATION_STAGE_UNSPECIFIED = 0

            # Candidate has applied or a recruiter put candidate into consideration but
            # candidate is not yet screened / no decision has been made to move or not
            # move the candidate to the next stage.
            NEW = 1

            # A recruiter decided to screen the candidate for this role.
            SCREEN = 2

            # Candidate is being / was sent to the customer / hiring manager for
            # detailed review.
            HIRING_MANAGER_REVIEW = 3

            # Candidate was approved by the client / hiring manager and is being / was
            # interviewed for the role.
            INTERVIEW = 4

            # Candidate will be / has been given an offer of employment.
            OFFER_EXTENDED = 5

            # Candidate has accepted their offer of employment.
            OFFER_ACCEPTED = 6

            # Candidate has begun (or completed) their employment or assignment with
            # the employer.
            STARTED = 7
          end

          # Enum that represents the application status.
          module ApplicationState
            # Default value.
            APPLICATION_STATE_UNSPECIFIED = 0

            # The current stage is in progress or pending, for example, interviews in
            # progress.
            IN_PROGRESS = 1

            # The current stage was terminated by a candidate decision.
            CANDIDATE_WITHDREW = 2

            # The current stage was terminated by an employer or agency decision.
            EMPLOYER_WITHDREW = 3

            # The current stage is successfully completed, but the next stage (if
            # applicable) has not begun.
            COMPLETED = 4

            # The current stage was closed without an exception, or terminated for
            # reasons unrealated to the candidate.
            CLOSED = 5
          end
        end
      end
    end
  end
end