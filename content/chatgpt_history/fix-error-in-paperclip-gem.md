---
title: Fix Error in Paperclip Gem
tags:
- open
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Why am I getting this error in Rails paperclip gem,
  only in a few random cases"
draft: false
---

# Fix Error in Paperclip Gem

## 🧠 Full Chat

🙋 **You:**

Why am I getting this error in Rails paperclip gem, only in a few random cases
undefined method `to_model' for #<Paperclip::Attachment>

<section class="my-12">
  <%= tag.h2 I18n.t('product_page.content.videos', name: offering.name) %>

  <div class="grid grid-cols-2 gap-4 items-start mt-10 lg:grid-cols-4 lg:gap-11">
    <% if videos.any? %>
      <% videos.each_with_index do |video, i| %>
        <%= button_tag type: 'button',
          class: 'group p-0 text-left bg-transparent hocus:no-underline',
          data: {
            action: 'modal#open',
            'modal-id-param': "videos-modal-#{i}"
          } do
        %>
          <div class="aspect-video mb-3">
            <%= image_tag(video.thumbnail, class: 'w-full h-full object-cover object-center bg-white shadow-sm', loading: 'lazy', alt: I18n.t('product_page.seo.video', name: video.title ), title: I18n.t('product_page.seo.video', name: video.title )) %>
          </div>

          <h3 class="h4 mt-0 mb-2 group-focus:underline group-hover:underline"><%= video.title %></h3>
          <p><%= truncate(video.description, length: 140) %></p>
        <% end %>
      <% end %>
    <% end %>

    <% if testimonial_videos.any? %>
      <% testimonial_videos.each_with_index do |video, i| %>
        <%= button_tag type: 'button',
          class: 'group p-0 text-left bg-transparent hocus:no-underline',
          data: {
            action: 'modal#open',
            'modal-id-param': "videos-testimonial-modal-#{i}"
          } do
        %>
          <div class="aspect-video mb-3">
            <%= image_tag(video.thumbnail, class: 'w-full h-full object-cover object-center bg-white shadow-sm', loading: 'lazy', alt: I18n.t('product_page.seo.testimonial_video', name: video.title ), title: I18n.t('product_page.seo.testimonial_video', name: video.title )) %>
          </div>

          <h3 class="h4 mt-0 mb-2 group-focus:underline group-hover:underline"><%= video.title %></h3>
          <p><%= truncate(video.description, length: 140) %></p>
        <% end %>
      <% end %>
    <% end %>

    <% if social_videos.any? %>
      <% social_videos.each_with_index do |video, i| %>
        <%= button_tag type: 'button',
          class: 'group p-0 text-left bg-transparent hocus:no-underline',
          data: {
            action: 'modal#open',
            'modal-id-param': "videos-social-modal-#{i}"
          } do
        %>
          <div class="aspect-video mb-3">
            <%= image_tag(video.dig('snippet', 'thumbnails', 'high', 'url'), class: 'w-full h-full object-cover object-center bg-white shadow-sm', loading: 'lazy', alt: I18n.t('product_page.seo.social_video', name: video.dig('snippet', 'title')&.first(110) ), title: I18n.t('product_page.seo.social_video', name: video.dig('snippet', 'title')&.first(110) )) %>
          </div>

          <h3 class="h4 mt-0 mb-2 group-focus:underline group-hover:underline"><%= video.dig('snippet', 'title')&.first(110) %></h3>
          <p><%= video.dig('snippet', 'channelTitle')&.first(25) %>&ensp;&bull;&ensp;<%= shorten_views(video.dig('statistics', 'viewCount')) %> views&ensp;&bull;&ensp;<%= time_ago_in_words(video.dig('snippet', 'publishedAt')) %> ago</p>
          <p><%= video.dig('snippet', 'description')&.truncate(140, separator: ' ') %></p>
        <% end %>
      <% end %>
    <% end %>
  </div>
</section>

It is failing in the video.thumbnail

---

🤖 **Assistant:**

The error message you're receiving is indicating that the method `to_model` is not defined for a Paperclip attachment. The method `to_model` is called when trying to convert an object to an ActiveRecord model. It is possible that this error is being thrown because the `video` object being passed to `image_tag` is not an ActiveRecord model, but instead a Paperclip attachment. To fix this, you may need to convert the attachment to an ActiveRecord model first, or provide a URL directly to the attachment instead of using `image_tag`.

---

🙋 **You:**

Please tell me more about the second option of providing a URL directly to the attachment.

---

🤖 **Assistant:**

The second option of providing a URL directly to the attachment involves generating a URL for a remote file or an asset that is hosted elsewhere. Instead of attaching a file from the local file system, you can provide a URL that points to the file or asset. This is useful in scenarios where the file is already hosted somewhere, or if you want to avoid the overhead of storing large files in your database or application. 

To use this option, you'll need to set the :url and :path options in your has_attached_file definition. The :url option specifies the URL where the file can be found, while the :path option determines the filesystem path to the file. 

For example, you could have something like this:

```
class User < ApplicationRecord
  has_attached_file :avatar,
    :url => ":s3_domain_url",
    :path => "/:class/:attachment/:id_partition/:style/:filename"
end
```

This sets the URL to be a URL on an Amazon S3 domain, while the path specifies the desired file path on the remote file system. When you call `user.avatar.url`, it will return the URL to the remote file, allowing you to access the file directly from your application.