
class Downloads

  #REPO_PREFIX        = "http://repository-projectodd.forge.cloudbees.com/staging/io/escalante"
  REPO_PREFIX        = "http://repository-projectodd.forge.cloudbees.com/release/io/escalante"

  def initialize(enabled=true)
    @enabled = enabled
  end

  def execute(site)
    return unless @enabled

    site.releases.each do |release|
      release.urls ||= OpenStruct.new
      release.urls.docs ||= OpenStruct.new
      release.urls.docs.browse = "#{site.base_url}/docs/#{release.version}/"

      release.urls.jira = "https://jira.jboss.org/jira/secure/IssueNavigator.jspa?reset=true&jqlQuery=project=IMMUTANT+AND+fixVersion=#{release.jira_version}&sorter/field=issuekey&sorter/order=DESC"

      release.urls.github ||= OpenStruct.new
      release.urls.github.log = "https://github.com/escalante/escalante/commits/#{release.version}"
      release.urls.github.tree = "https://github.com/escalante/escalante/tree/#{release.version}"

      release_suffix = "/escalante-dist/#{release.version}/escalante-dist-#{release.version}-bin.zip"
      release.urls.remote_dist_zip  = "#{REPO_PREFIX}#{release_suffix}"
    end
  end

end
