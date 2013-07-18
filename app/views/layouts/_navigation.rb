<div class="navigation">
  <% if current_user %>
    <%= link_to 'Logout', session_path(current_user), :method => :delete %>
  <% end %>
</div>
