defmodule AWSSandboxS3 do
  @moduledoc """
  AWSSandboxS3 is a simple library to mock S3 api requests.

  ## Testing

  Here's an example of how it can be used during testing:

  ```elixir
  # Start the registry. This is usually placed in `test_helper.exs`
  # or in the setup block before your test.
  AWSSandboxS3.start_link()
  {:ok, #PID<0.213.0>}

  # Set the responses for your function call
  AWSSandboxS3.set_list_objects_responses([
    {"bucket", fn _ -> {:ok, [%{key: "example.txt"}]} end}
  ])

  # Get the responses for your function call
  AWSSandboxS3.list_objects_response("bucket")
  {:ok, [%{key: "example.txt"}]}
  ```
  """

  @sleep 10
  @registry :aws_sandbox_s3
  @keys :unique

  @disabled "disabled"
  @state "state"

  @type bucket :: String.t() | Regex.t()
  @type dest_bucket :: bucket()
  @type src_bucket :: bucket()
  @type key :: String.t()
  @type object :: String.t()
  @type objects :: list(object())
  @type dest_object :: object()
  @type src_object :: object()
  @type path :: String.t()
  @type dest :: String.t()
  @type origin :: String.t()
  @type http_method :: String.t()
  @type body :: map() | any()
  @type region :: String.t()
  @type payer :: String.t()
  @type grants :: any()
  @type config :: any()
  @type logging_config :: any()
  @type notification_config :: any()
  @type replication_config :: any()
  @type version_config :: any()
  @type website_config :: any()
  @type cors_rules :: list()
  @type lifecycle_rules :: list()
  @type source :: any()
  @type acl :: any()
  @type policy :: any()
  @type tagging :: any()
  @type tags :: list()
  @type part_number :: any()
  @type request_method :: String.t()
  @type request_headers :: list(String.t())
  @type number_of_days :: any()
  @type upload_id :: any()
  @type options :: Keyword.t()
  @type response :: any()
  @type action ::
    :abort_multipart_upload
    | :complete_multipart_upload
    | :delete_all_objects
    | :delete_bucket
    | :delete_bucket_cors
    | :delete_bucket_lifecycle
    | :delete_bucket_policy
    | :delete_bucket_replication
    | :delete_bucket_tagging
    | :delete_bucket_website
    | :delete_multiple_objects
    | :delete_object
    | :delete_object_tagging
    | :download_file
    | :get_bucket_acl
    | :get_bucket_cors
    | :get_bucket_lifecycle
    | :get_bucket_location
    | :get_bucket_logging
    | :get_bucket_notification
    | :get_bucket_object_versions
    | :get_bucket_policy
    | :get_bucket_replication
    | :get_bucket_request_payment
    | :get_bucket_tagging
    | :get_bucket_versioning
    | :get_bucket_website
    | :get_object
    | :get_object_acl
    | :get_object_tagging
    | :get_object_torrent
    | :head_bucket
    | :head_object
    | :initiate_multipart_upload
    | :list_objects
    | :list_buckets
    | :list_multipart_uploads
    | :list_objects
    | :list_objects_v2
    | :list_parts
    | :options_object
    | :post_object_restore
    | :presigned_post
    | :presigned_url
    | :put_bucket
    | :put_bucket_acl
    | :put_bucket_cors
    | :put_bucket_lifecycle
    | :put_bucket_logging
    | :put_bucket_notification
    | :put_bucket_policy
    | :put_bucket_replication
    | :put_bucket_request_payment
    | :put_bucket_tagging
    | :put_bucket_versioning
    | :put_bucket_website
    | :put_object
    | :put_object_acl
    | :put_object_copy
    | :put_object_tagging
    | :upload
    | :upload_part
    | :upload_part_copy

  @doc """
  Starts the registry process linked to the current process.
  """
  @spec start_link :: {:ok, pid()} | {:error, any()}
  def start_link do
    Registry.start_link(keys: @keys, name: @registry)
  end

  @doc """
  Return the responses set for the action `abort_multipart_upload`.

  ## Examples

      iex> AWSSandboxS3.set_abort_multipart_upload_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.abort_multipart_upload_response("bucket", "object", 1, [])
      :ok
  """
  @spec abort_multipart_upload_response(bucket(), object(), upload_id(), options()) :: response
  def abort_multipart_upload_response(bucket, object, upload_id, options) do
    func = find!(:abort_multipart_upload, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, upload_id)
      4 -> func.(bucket, object, upload_id, options)
    end
  end

  @doc """
  Return the responses set for the action `complete_multipart_upload`.

  ## Examples

      iex> AWSSandboxS3.set_complete_multipart_upload_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.complete_multipart_upload_response("bucket", "object", 1, [])
      :ok
  """
  @spec complete_multipart_upload_response(bucket(), object(), upload_id(), options()) :: response
  def complete_multipart_upload_response(bucket, object, upload_id, options) do
    func = find!(:complete_multipart_upload, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, upload_id)
      4 -> func.(bucket, object, upload_id, options)
    end
  end

  @doc """
  Return the responses set for the action `delete_all_objects`.

  ## Examples

      iex> AWSSandboxS3.set_delete_all_objects_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.delete_all_objects_response("bucket", [%{}], [])
      :ok
  """
  @spec delete_all_objects_response(bucket(), objects(), options()) :: response
  def delete_all_objects_response(bucket, objects, options) do
    func = find!(:delete_all_objects, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, objects)
      3 -> func.(bucket, objects, options)
    end
  end

  @doc """
  Return the responses set for the action `delete_bucket`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.delete_bucket_response("bucket")
      :ok
  """
  @spec delete_bucket_response(bucket()) :: response
  def delete_bucket_response(bucket) do
    func = find!(:delete_bucket, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `delete_bucket_cors`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_cors_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.delete_bucket_cors_response("bucket")
      :ok
  """
  @spec delete_bucket_cors_response(bucket()) :: response
  def delete_bucket_cors_response(bucket) do
    func = find!(:delete_bucket_cors, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `delete_bucket_lifecycle`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_lifecycle_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.delete_bucket_lifecycle_response("bucket")
      :ok
  """
  @spec delete_bucket_lifecycle_response(bucket()) :: response
  def delete_bucket_lifecycle_response(bucket) do
    func = find!(:delete_bucket_lifecycle, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `delete_bucket_policy`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_policy_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.delete_bucket_policy_response("bucket")
      :ok
  """
  @spec delete_bucket_policy_response(bucket()) :: response
  def delete_bucket_policy_response(bucket) do
    func = find!(:delete_bucket_policy, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `delete_bucket_replication`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_replication_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.delete_bucket_replication_response("bucket")
      :ok
  """
  @spec delete_bucket_replication_response(bucket()) :: response
  def delete_bucket_replication_response(bucket) do
    func = find!(:delete_bucket_replication, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `delete_bucket_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_tagging_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.delete_bucket_tagging_response("bucket")
      :ok
  """
  @spec delete_bucket_tagging_response(bucket()) :: response
  def delete_bucket_tagging_response(bucket) do
    func = find!(:delete_bucket_tagging, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `delete_bucket_website`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_website_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.delete_bucket_website_response("bucket")
      :ok
  """
  @spec delete_bucket_website_response(bucket()) :: response
  def delete_bucket_website_response(bucket) do
    func = find!(:delete_bucket_website, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `delete_multiple_objects`.

  ## Examples

      iex> AWSSandboxS3.set_delete_multiple_objects_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.delete_multiple_objects_response("bucket", [], [])
      :ok
  """
  @spec delete_multiple_objects_response(bucket(), objects(), options()) :: response
  def delete_multiple_objects_response(bucket, objects, options) do
    func = find!(:delete_multiple_objects, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, objects)
      3 -> func.(bucket, objects, options)
    end
  end

  @doc """
  Return the responses set for the action `delete_object`.

  ## Examples

      iex> AWSSandboxS3.set_delete_object_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.delete_object_response("bucket", [], [])
      :ok
  """
  @spec delete_object_response(bucket(), object(), options()) :: response
  def delete_object_response(bucket, object, options) do
    func = find!(:delete_object, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, options)
    end
  end

  @doc """
  Return the responses set for the action `delete_object_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_delete_object_tagging_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.delete_object_tagging_response("bucket", [], [])
      :ok
  """
  @spec delete_object_tagging_response(bucket(), object(), options()) :: response
  def delete_object_tagging_response(bucket, object, options) do
    func = find!(:delete_object_tagging, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, options)
    end
  end

  @doc """
  Return the responses set for the action `download_file`.

  ## Examples

      iex> AWSSandboxS3.set_download_file_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.download_file_response("bucket", "file.txt", "file.txt", [])
      :ok
  """
  @spec download_file_response(bucket(), path(), dest(), options()) :: response
  def download_file_response(bucket, path, dest, options) do
    func = find!(:download_file, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, path)
      3 -> func.(bucket, path, dest)
      4 -> func.(bucket, path, dest, options)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_acl`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_acl_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_acl_response("bucket")
      :ok
  """
  @spec get_bucket_acl_response(bucket()) :: response
  def get_bucket_acl_response(bucket) do
    func = find!(:get_bucket_acl, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_cors`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_cors_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_cors_response("bucket")
      :ok
  """
  @spec get_bucket_cors_response(bucket()) :: response
  def get_bucket_cors_response(bucket) do
    func = find!(:get_bucket_cors, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_lifecycle`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_lifecycle_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_lifecycle_response("bucket")
      :ok
  """
  @spec get_bucket_lifecycle_response(bucket()) :: response
  def get_bucket_lifecycle_response(bucket) do
    func = find!(:get_bucket_lifecycle, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_location`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_location_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_location_response("bucket")
      :ok
  """
  @spec get_bucket_location_response(bucket()) :: response
  def get_bucket_location_response(bucket) do
    func = find!(:get_bucket_location, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_logging`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_logging_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_logging_response("bucket")
      :ok
  """
  @spec get_bucket_logging_response(bucket()) :: response
  def get_bucket_logging_response(bucket) do
    func = find!(:get_bucket_logging, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_notification`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_notification_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_notification_response("bucket")
      :ok
  """
  @spec get_bucket_notification_response(bucket()) :: response
  def get_bucket_notification_response(bucket) do
    func = find!(:get_bucket_notification, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_object_versions`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_object_versions_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_object_versions_response("bucket", [])
      :ok
  """
  @spec get_bucket_object_versions_response(bucket(), options()) :: response
  def get_bucket_object_versions_response(bucket, options) do
    func = find!(:get_bucket_object_versions, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, options)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_replication`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_replication_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_replication_response("bucket")
      :ok
  """
  @spec get_bucket_replication_response(bucket()) :: response
  def get_bucket_replication_response(bucket) do
    func = find!(:get_bucket_replication, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_request_payment`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_request_payment_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_request_payment_response("bucket")
      :ok
  """
  @spec get_bucket_request_payment_response(bucket()) :: response
  def get_bucket_request_payment_response(bucket) do
    func = find!(:get_bucket_request_payment, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_tagging_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_tagging_response("bucket")
      :ok
  """
  @spec get_bucket_tagging_response(bucket()) :: response
  def get_bucket_tagging_response(bucket) do
    func = find!(:get_bucket_tagging, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_versioning`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_versioning_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_versioning_response("bucket")
      :ok
  """
  @spec get_bucket_versioning_response(bucket()) :: response
  def get_bucket_versioning_response(bucket) do
    func = find!(:get_bucket_versioning, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `get_bucket_website`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_website_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_bucket_website_response("bucket")
      :ok
  """
  @spec get_bucket_website_response(bucket()) :: response
  def get_bucket_website_response(bucket) do
    func = find!(:get_bucket_website, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `get_object`.

  ## Examples

      iex> AWSSandboxS3.set_get_object_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_object_response("bucket", "object.txt", [])
      :ok
  """
  @spec get_object_response(bucket(), object(), options()) :: response
  def get_object_response(bucket, object, options) do
    func = find!(:get_object, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, options)
    end
  end

  @doc """
  Return the responses set for the action `get_object_acl`.

  ## Examples

      iex> AWSSandboxS3.set_get_object_acl_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_object_acl_response("bucket", "object.txt", [])
      :ok
  """
  @spec get_object_acl_response(bucket(), object(), options()) :: response
  def get_object_acl_response(bucket, object, options) do
    func = find!(:get_object_acl, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, options)
    end
  end

  @doc """
  Return the responses set for the action `get_object_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_get_object_tagging_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_object_tagging_response("bucket", "object.txt", [])
      :ok
  """
  @spec get_object_tagging_response(bucket(), object(), options()) :: response
  def get_object_tagging_response(bucket, object, options) do
    func = find!(:get_object_tagging, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, options)
    end
  end

  @doc """
  Return the responses set for the action `get_object_torrent`.

  ## Examples

      iex> AWSSandboxS3.set_get_object_torrent_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.get_object_torrent_response("bucket", "object.txt")
      :ok
  """
  @spec get_object_torrent_response(bucket(), object()) :: response
  def get_object_torrent_response(bucket, object) do
    func = find!(:get_object_torrent, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
    end
  end

  @doc """
  Return the responses set for the action `head_bucket`.

  ## Examples

      iex> AWSSandboxS3.set_head_bucket_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.head_bucket_response("bucket")
      :ok
  """
  @spec head_bucket_response(bucket()) :: response
  def head_bucket_response(bucket) do
    func = find!(:head_bucket, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
    end
  end

  @doc """
  Return the responses set for the action `head_object`.

  ## Examples

      iex> AWSSandboxS3.set_head_object_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.head_object_response("bucket", "object.txt", [])
      :ok
  """
  @spec head_object_response(bucket(), object(), options()) :: response
  def head_object_response(bucket, object, options) do
    func = find!(:head_object, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, options)
    end
  end

  @doc """
  Return the responses set for the action `initiate_multipart_upload`.

  ## Examples

      iex> AWSSandboxS3.set_initiate_multipart_upload_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.initiate_multipart_upload_response("bucket", "object.txt", [])
      :ok
  """
  @spec initiate_multipart_upload_response(bucket(), object(), options()) :: response
  def initiate_multipart_upload_response(bucket, object, options) do
    func = find!(:initiate_multipart_upload, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, options)
    end
  end

  @doc """
  Return the responses set for the action `list_buckets`.

  ## Examples

      iex> AWSSandboxS3.set_list_buckets_responses(fn -> {:ok, ["example"]} end)
      ...> AWSSandboxS3.list_buckets_response()
      {:ok, ["example"]}
  """
  @spec list_buckets_response :: response()
  def list_buckets_response do
    func = find!(:list_buckets)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
    end
  end

  @doc """
  Return the responses set for the action `list_multipart_upload`.

  ## Examples

      iex> AWSSandboxS3.set_list_multipart_uploads_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.list_multipart_uploads_response("bucket")
      :ok
  """
  @spec list_multipart_uploads_response(bucket(), options()) :: response
  def list_multipart_uploads_response(bucket, options \\ []) do
    func = find!(:list_multipart_uploads, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, options)
    end
  end

  @doc """
  Return the responses set for the action `list_objects`.

  ## Examples

      iex> AWSSandboxS3.set_list_objects_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.list_objects_response("bucket")
      :ok
  """
  @spec list_objects_response(bucket(), options()) :: response
  def list_objects_response(bucket, options \\ []) do
    func = find!(:list_objects, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, options)
    end
  end

  @doc """
  Return the responses set for the action `list_parts`.

  ## Examples

      iex> AWSSandboxS3.set_list_parts_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.list_parts_response("bucket", "object", 1, [])
      :ok
  """
  @spec list_parts_response(bucket(), object(), upload_id(), options()) :: response
  def list_parts_response(bucket, object, upload_id, options) do
    func = find!(:list_parts, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, upload_id)
      4 -> func.(bucket, object, upload_id, options)
    end
  end

  @doc """
  Return the responses set for the action `options_object`.

  ## Examples

      iex> AWSSandboxS3.set_options_object_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.options_object_response("bucket", "object", "", "", [])
      :ok
  """
  @spec options_object_response(bucket(), object(), origin(), request_method(), request_headers()) :: response
  def options_object_response(bucket, object, origin, request_method, request_headers) do
    func = find!(:options_object, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, origin)
      4 -> func.(bucket, object, origin, request_method)
      5 -> func.(bucket, object, origin, request_method, request_headers)
    end
  end

  @doc """
  Return the responses set for the action `post_object_restore`.

  ## Examples

      iex> AWSSandboxS3.set_post_object_restore_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.post_object_restore_response("bucket", "object", 1, [])
      :ok
  """
  @spec post_object_restore_response(bucket(), object(), number_of_days(), options()) :: response
  def post_object_restore_response(bucket, object, number_of_days, options) do
    func = find!(:post_object_restore, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, number_of_days)
      4 -> func.(bucket, object, number_of_days, options)
    end
  end

  @doc """
  Return the responses set for the action `presigned_post`.

  ## Examples

      iex> AWSSandboxS3.set_presigned_post_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.presigned_post_response("bucket", "key.txt", %{}, [])
      :ok
  """
  @spec presigned_post_response(bucket(), key(), config(), options()) :: response
  def presigned_post_response(bucket, key, config, options) do
    func = find!(:presigned_post, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, key)
      3 -> func.(bucket, key, config)
      4 -> func.(bucket, key, config, options)
    end
  end

  @doc """
  Return the responses set for the action `presigned_url`.

  ## Examples

      iex> AWSSandboxS3.set_presigned_url_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.presigned_url_response("bucket", "object.txt", "post", %{}, [])
      :ok
  """
  @spec presigned_url_response(bucket(), object(), http_method(), config(), options()) :: response
  def presigned_url_response(bucket, object, http_method, config, options) do
    func = find!(:presigned_url, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, http_method)
      4 -> func.(bucket, object, http_method, config)
      5 -> func.(bucket, object, http_method, config, options)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_response("bucket", "us-west-1", [])
      :ok
  """
  @spec put_bucket_response(bucket(), region(), options()) :: response
  def put_bucket_response(bucket, region, options) do
    func = find!(:put_bucket, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, region)
      3 -> func.(bucket, region, options)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket_acl`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_acl_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_acl_response("bucket", [])
      :ok
  """
  @spec put_bucket_acl_response(bucket(), grants()) :: response
  def put_bucket_acl_response(bucket, grants) do
    func = find!(:put_bucket_acl, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, grants)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket_cors`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_cors_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_cors_response("bucket", [])
      :ok
  """
  @spec put_bucket_cors_response(bucket(), cors_rules()) :: response
  def put_bucket_cors_response(bucket, cors_rules) do
    func = find!(:put_bucket_cors, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, cors_rules)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket_lifecycle`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_lifecycle_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_lifecycle_response("bucket", [])
      :ok
  """
  @spec put_bucket_lifecycle_response(bucket(), lifecycle_rules()) :: response
  def put_bucket_lifecycle_response(bucket, lifecycle_rules) do
    func = find!(:put_bucket_lifecycle, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, lifecycle_rules)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket_logging`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_logging_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_logging_response("bucket", %{})
      :ok
  """
  @spec put_bucket_logging_response(bucket(), logging_config()) :: response
  def put_bucket_logging_response(bucket, logging_config) do
    func = find!(:put_bucket_logging, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, logging_config)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket_notification`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_notification_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_notification_response("bucket", %{})
      :ok
  """
  @spec put_bucket_notification_response(bucket(), notification_config()) :: response
  def put_bucket_notification_response(bucket, notification_config) do
    func = find!(:put_bucket_notification, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, notification_config)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket_policy`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_policy_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_policy_response("bucket", %{})
      :ok
  """
  @spec put_bucket_policy_response(bucket(), policy()) :: response
  def put_bucket_policy_response(bucket, policy) do
    func = find!(:put_bucket_policy, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, policy)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket_replication`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_replication_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_replication_response("bucket", %{})
      :ok
  """
  @spec put_bucket_replication_response(bucket(), replication_config()) :: response
  def put_bucket_replication_response(bucket, replication_config) do
    func = find!(:put_bucket_replication, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, replication_config)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket_request_payment`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_request_payment_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_request_payment_response("bucket", %{})
      :ok
  """
  @spec put_bucket_request_payment_response(bucket(), payer()) :: response
  def put_bucket_request_payment_response(bucket, payer) do
    func = find!(:put_bucket_request_payment, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, payer)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_tagging_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_tagging_response("bucket", %{})
      :ok
  """
  @spec put_bucket_tagging_response(bucket(), tagging()) :: response
  def put_bucket_tagging_response(bucket, tagging) do
    func = find!(:put_bucket_tagging, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, tagging)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket_versioning`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_versioning_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_versioning_response("bucket", %{})
      :ok
  """
  @spec put_bucket_versioning_response(bucket(), version_config()) :: response
  def put_bucket_versioning_response(bucket, version_config) do
    func = find!(:put_bucket_versioning, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, version_config)
    end
  end

  @doc """
  Return the responses set for the action `put_bucket_website`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_website_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_bucket_website_response("bucket", %{})
      :ok
  """
  @spec put_bucket_website_response(bucket(), website_config()) :: response
  def put_bucket_website_response(bucket, website_config) do
    func = find!(:put_bucket_website, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, website_config)
    end
  end

  @doc """
  Return the responses set for the action `put_object`.

  ## Examples

      iex> AWSSandboxS3.set_put_object_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_object_response("bucket", "object", %{}, [])
      :ok
  """
  @spec put_object_response(bucket(), object(), body(), options()) :: response
  def put_object_response(bucket, object, body, options) do
    func = find!(:put_object, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, body)
      4 -> func.(bucket, object, body, options)
    end
  end

  @doc """
  Return the responses set for the action `put_object_acl`.

  ## Examples

      iex> AWSSandboxS3.set_put_object_acl_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_object_acl_response("bucket", "object", "")
      :ok
  """
  @spec put_object_acl_response(bucket(), object(), acl()) :: response
  def put_object_acl_response(bucket, object, acl) do
    func = find!(:put_object_acl, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, acl)
    end
  end

  @doc """
  Return the responses set for the action `put_object_copy`.

  ## Examples

      iex> AWSSandboxS3.set_put_object_copy_responses([{"dest-bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_object_copy_response("dest-bucket", "dest_object", "src-bucket", "src_object", [])
      :ok
  """
  @spec put_object_copy_response(dest_bucket(), dest_object(), src_bucket(), src_object(), options()) :: response
  def put_object_copy_response(dest_bucket, dest_object, src_bucket, src_object, options) do
    func = find!(:put_object_copy, dest_bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(dest_bucket)
      2 -> func.(dest_bucket, dest_object)
      3 -> func.(dest_bucket, dest_object, src_bucket)
      4 -> func.(dest_bucket, dest_object, src_bucket, src_object)
      5 -> func.(dest_bucket, dest_object, src_bucket, src_object, options)
    end
  end

  @doc """
  Return the responses set for the action `put_object_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_put_object_tagging_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.put_object_tagging_response("bucket", "object", %{}, [])
      :ok
  """
  @spec put_object_tagging_response(bucket(), object(), tags(), options()) :: response
  def put_object_tagging_response(bucket, object, tags, options) do
    func = find!(:put_object_tagging, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, tags)
      4 -> func.(bucket, object, tags, options)
    end
  end

  @doc """
  Return the responses set for the action `upload`.

  ## Examples

      iex> AWSSandboxS3.set_upload_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.upload_response("source_file.txt", "bucket", "object.txt", [])
      :ok
  """
  @spec upload_response(source(), bucket(), path(), options()) :: response
  def upload_response(source, bucket, path, options) do
    func = find!(:upload, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(source)
      2 -> func.(source, bucket)
      3 -> func.(source, bucket, path)
      4 -> func.(source, bucket, path, options)
    end
  end

  @doc """
  Return the responses set for the action `upload_part`.

  ## Examples

      iex> AWSSandboxS3.set_upload_part_responses([{"bucket", fn -> :ok end}])
      ...> AWSSandboxS3.upload_part_response("bucket", "", 1, 1, %{}, [])
      :ok
  """
  @spec upload_part_response(bucket(), object(), upload_id(), part_number(), body(), options()) :: response
  def upload_part_response(bucket, object, upload_id, part_number, body, options) do
    func = find!(:upload_part, bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(bucket)
      2 -> func.(bucket, object)
      3 -> func.(bucket, object, upload_id)
      4 -> func.(bucket, object, upload_id, part_number)
      5 -> func.(bucket, object, upload_id, part_number, body)
      6 -> func.(bucket, object, upload_id, part_number, body, options)
    end
  end

  @doc """
  Return the responses set for the action `upload_part_copy`.

  upload_part_copy(dest_bucket, dest_object, src_bucket, src_object, opts \\ [])

  ## Examples

      iex> AWSSandboxS3.set_upload_part_copy_responses([{"dest-bucket", fn -> :ok end}])
      ...> AWSSandboxS3.upload_part_copy_response("dest-bucket", "dest_object.txt", "src-bucket", "dest_object.txt", [])
      :ok
  """
  @spec upload_part_copy_response(bucket(), dest_object(), src_bucket(), src_object(), options()) :: response
  def upload_part_copy_response(dest_bucket, dest_object, src_bucket, src_object, options) do
    func = find!(:upload_part_copy, dest_bucket)

    case :erlang.fun_info(func)[:arity] do
      0 -> func.()
      1 -> func.(dest_bucket)
      2 -> func.(dest_bucket, dest_object)
      3 -> func.(dest_bucket, dest_object, src_bucket)
      4 -> func.(dest_bucket, dest_object, src_bucket, src_object)
      5 -> func.(dest_bucket, dest_object, src_bucket, src_object, options)
    end
  end

  @doc """
  Set a response for the function `abort_multipart_upload`.

  ## Examples

      iex> AWSSandboxS3.set_abort_multipart_upload_responses([
      ...>  {"bucket", fn _bucket, _object, _upload_id, _options -> :ok end}
      ...> ])
      :ok
  """
  @spec set_abort_multipart_upload_responses(fun()) :: :ok
  def set_abort_multipart_upload_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:abort_multipart_upload, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `complete_multipart_upload`.

  ## Examples

      iex> AWSSandboxS3.set_complete_multipart_upload_responses([
      ...> {"bucket", fn _bucket, _object, _upload_id, _options -> :ok end}
      ...> ])
      :ok
  """
  @spec set_complete_multipart_upload_responses(fun()) :: :ok
  def set_complete_multipart_upload_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:complete_multipart_upload, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `delete_all_objects`.

  ## Examples

      iex> AWSSandboxS3.set_delete_all_objects_responses([
      ...> {"bucket", fn _bucket, _objects, _options -> :ok end}
      ...> ])
      :ok
  """
  @spec set_delete_all_objects_responses(fun()) :: :ok
  def set_delete_all_objects_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:delete_all_objects, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `delete_bucket`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_responses([
      ...> {"bucket", fn _bucket -> :ok end}
      ...> ])
      :ok
  """
  @spec set_delete_bucket_responses(fun()) :: :ok
  def set_delete_bucket_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:delete_bucket, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `delete_bucket_cors`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_cors_responses([
      ...> {"bucket", fn _bucket -> :ok end}
      ...> ])
      :ok
  """
  @spec set_delete_bucket_cors_responses(fun()) :: :ok
  def set_delete_bucket_cors_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:delete_bucket_cors, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `delete_bucket_lifecycle`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_lifecycle_responses([
      ...> {"bucket", fn _bucket -> :ok end}
      ...> ])
      :ok
  """
  @spec set_delete_bucket_lifecycle_responses(fun()) :: :ok
  def set_delete_bucket_lifecycle_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:delete_bucket_lifecycle, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `delete_bucket_policy`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_policy_responses([
      ...> {"bucket", fn _bucket -> :ok end}
      ...> ])
      :ok
  """
  @spec set_delete_bucket_policy_responses(fun()) :: :ok
  def set_delete_bucket_policy_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:delete_bucket_policy, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `delete_bucket_replication`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_replication_responses([
      ...> {"bucket", fn _bucket -> :ok end}
      ...> ])
      :ok
  """
  @spec set_delete_bucket_replication_responses(fun()) :: :ok
  def set_delete_bucket_replication_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:delete_bucket_replication, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `delete_bucket_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_tagging_responses([
      ...> {"bucket", fn _bucket -> :ok end}
      ...> ])
      :ok
  """
  @spec set_delete_bucket_tagging_responses(fun()) :: :ok
  def set_delete_bucket_tagging_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:delete_bucket_tagging, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `delete_bucket_website`.

  ## Examples

      iex> AWSSandboxS3.set_delete_bucket_website_responses([
      ...> {"bucket", fn _bucket -> :ok end}
      ...> ])
      :ok
  """
  @spec set_delete_bucket_website_responses(fun()) :: :ok
  def set_delete_bucket_website_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:delete_bucket_website, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `delete_multiple_objects`.

  ## Examples

      iex> AWSSandboxS3.set_delete_multiple_objects_responses([
      ...>  {"bucket", fn _bucket, _objects, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _objects -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_delete_multiple_objects_responses(fun()) :: :ok
  def set_delete_multiple_objects_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:delete_multiple_objects, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `delete_object`.

  ## Examples

      iex> AWSSandboxS3.set_delete_object_responses([
      ...>  {"bucket", fn _bucket, _object, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_delete_object_responses(fun()) :: :ok
  def set_delete_object_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:delete_object, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `delete_object_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_delete_object_tagging_responses([
      ...>  {"bucket", fn _bucket, _object, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_delete_object_tagging_responses(fun()) :: :ok
  def set_delete_object_tagging_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:delete_object_tagging, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `download_file`.

  ## Examples

      iex> AWSSandboxS3.set_download_file_responses([
      ...>  {"bucket", fn _bucket, _path, _dest, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _path, _dest -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _path -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_download_file_responses(fun()) :: :ok
  def set_download_file_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:download_file, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_acl`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_acl_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_acl_responses(fun()) :: :ok
  def set_get_bucket_acl_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_acl, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_cors`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_cors_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_cors_responses(fun()) :: :ok
  def set_get_bucket_cors_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_cors, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_lifecycle`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_lifecycle_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_lifecycle_responses(fun()) :: :ok
  def set_get_bucket_lifecycle_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_lifecycle, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_location`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_location_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_location_responses(fun()) :: :ok
  def set_get_bucket_location_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_location, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_logging`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_logging_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_logging_responses(fun()) :: :ok
  def set_get_bucket_logging_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_logging, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_notification`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_notification_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_notification_responses(fun()) :: :ok
  def set_get_bucket_notification_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_notification, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_object_versions`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_object_versions_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_object_versions_responses(fun()) :: :ok
  def set_get_bucket_object_versions_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_object_versions, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_policy`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_policy_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_policy_responses(fun()) :: :ok
  def set_get_bucket_policy_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_policy, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_replication`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_replication_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_replication_responses(fun()) :: :ok
  def set_get_bucket_replication_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_replication, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_request_payment`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_request_payment_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_request_payment_responses(fun()) :: :ok
  def set_get_bucket_request_payment_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_request_payment, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_tagging_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_tagging_responses(fun()) :: :ok
  def set_get_bucket_tagging_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_tagging, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_versioning`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_versioning_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_versioning_responses(fun()) :: :ok
  def set_get_bucket_versioning_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_versioning, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_bucket_website`.

  ## Examples

      iex> AWSSandboxS3.set_get_bucket_website_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_bucket_website_responses(fun()) :: :ok
  def set_get_bucket_website_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_bucket_website, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_object`.

  ## Examples

      iex> AWSSandboxS3.set_get_object_responses([
      ...>  {"bucket", fn _bucket, _object, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_object_responses(fun()) :: :ok
  def set_get_object_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_object, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_object_acl`.

  ## Examples

      iex> AWSSandboxS3.set_get_object_acl_responses([
      ...>  {"bucket", fn _bucket, _object, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_object_acl_responses(fun()) :: :ok
  def set_get_object_acl_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_object_acl, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_object_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_get_object_tagging_responses([
      ...>  {"bucket", fn _bucket, _object, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_object_tagging_responses(fun()) :: :ok
  def set_get_object_tagging_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_object_tagging, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `get_object_torrent`.

  ## Examples

      iex> AWSSandboxS3.set_get_object_torrent_responses([
      ...>  {"bucket", fn _bucket, _object, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_get_object_torrent_responses(fun()) :: :ok
  def set_get_object_torrent_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:get_object_torrent, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `head_bucket`.

  ## Examples

      iex> AWSSandboxS3.set_head_bucket_responses([
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_head_bucket_responses(fun()) :: :ok
  def set_head_bucket_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:head_bucket, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `head_object`.

  ## Examples

      iex> AWSSandboxS3.set_head_object_responses([
      ...>  {"bucket", fn _bucket, _object, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_head_object_responses(fun()) :: :ok
  def set_head_object_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:head_object, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `initiate_multipart_upload`.

  ## Examples

      iex> AWSSandboxS3.set_initiate_multipart_upload_responses([
      ...>  {"bucket", fn _bucket, _object, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn  -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_initiate_multipart_upload_responses(fun()) :: :ok
  def set_initiate_multipart_upload_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:initiate_multipart_upload, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `list_buckets`.

  ## Examples

      iex> AWSSandboxS3.set_list_buckets_responses(fn -> {:ok, ["bucket"]}  end)
      :ok
  """
  @spec set_list_buckets_responses(fun()) :: :ok
  def set_list_buckets_responses(func) do
    @registry
    |> SandboxRegistry.register(@state, func, @keys)
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `list_multipart_uploads`.

  ## Examples

      iex> AWSSandboxS3.set_list_multipart_uploads_responses([
      ...>  {"bucket", fn _bucket, _object, _upload_id, _options -> :ok end}
      ...> ])
      :ok
  """
  @spec set_list_multipart_uploads_responses(fun()) :: :ok
  def set_list_multipart_uploads_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:list_multipart_uploads, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `list_objects`.

  ## Examples

      iex> AWSSandboxS3.set_list_objects_responses([
      ...>  {"bucket", fn _bucket, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_list_objects_responses(fun()) :: :ok
  def set_list_objects_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:list_objects, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `list_parts`.

  ## Examples

      iex> AWSSandboxS3.set_list_parts_responses([
      ...>  {"bucket", fn _bucket, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_list_parts_responses(fun()) :: :ok
  def set_list_parts_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:list_parts, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `options_object`.

  ## Examples

      iex> AWSSandboxS3.set_options_object_responses([
      ...>  {"bucket", fn _bucket, _object, _origin, _request_method, _request_headers -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _origin, _request_method -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _origin -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_options_object_responses(fun()) :: :ok
  def set_options_object_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:options_object, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `post_object_restore`.

  ## Examples

      iex> AWSSandboxS3.set_post_object_restore_responses([
      ...>  {"bucket", fn _bucket, _object, _number_of_days, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _number_of_days -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_post_object_restore_responses(fun()) :: :ok
  def set_post_object_restore_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:post_object_restore, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `presigned_post`.

  ## Examples

      iex> AWSSandboxS3.set_presigned_post_responses([
      ...>  {"bucket", fn _bucket, _key, _config, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _key, _config -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _key -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  # or
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_presigned_post_responses(fun()) :: :ok
  def set_presigned_post_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:presigned_post, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `presigned_url`.

  ## Examples

      iex> AWSSandboxS3.set_presigned_url_responses([
      ...>  {"bucket", fn _bucket, _object, _http_method, _config, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _http_method, _config -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _http_method -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_presigned_url_responses(fun()) :: :ok
  def set_presigned_url_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:presigned_url, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_responses([
      ...>  {"bucket", fn _bucket, _region, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _region -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_responses(fun()) :: :ok
  def set_put_bucket_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket_acl`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_acl_responses([
      ...>  {"bucket", fn _bucket, _grants -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_acl_responses(fun()) :: :ok
  def set_put_bucket_acl_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket_acl, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket_cors`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_cors_responses([
      ...>  {"bucket", fn _bucket, _rules -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_cors_responses(fun()) :: :ok
  def set_put_bucket_cors_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket_cors, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket_lifecycle`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_lifecycle_responses([
      ...>  {"bucket", fn _bucket, _rules -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_lifecycle_responses(fun()) :: :ok
  def set_put_bucket_lifecycle_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket_lifecycle, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket_logging`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_logging_responses([
      ...>  {"bucket", fn _bucket, _config -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_logging_responses(fun()) :: :ok
  def set_put_bucket_logging_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket_logging, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket_notification`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_notification_responses([
      ...>  {"bucket", fn _bucket, _config -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_notification_responses(fun()) :: :ok
  def set_put_bucket_notification_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket_notification, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket_policy`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_policy_responses([
      ...>  {"bucket", fn _bucket, _config -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_policy_responses(fun()) :: :ok
  def set_put_bucket_policy_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket_policy, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket_replication`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_replication_responses([
      ...>  {"bucket", fn _bucket, _config -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_replication_responses(fun()) :: :ok
  def set_put_bucket_replication_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket_replication, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket_request_payment`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_request_payment_responses([
      ...>  {"bucket", fn _bucket, _payer -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_request_payment_responses(fun()) :: :ok
  def set_put_bucket_request_payment_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket_request_payment, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_tagging_responses([
      ...>  {"bucket", fn _bucket, _tags -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_tagging_responses(fun()) :: :ok
  def set_put_bucket_tagging_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket_tagging, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket_versioning`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_versioning_responses([
      ...>  {"bucket", fn _bucket, _config -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_versioning_responses(fun()) :: :ok
  def set_put_bucket_versioning_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket_versioning, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_bucket_website`.

  ## Examples

      iex> AWSSandboxS3.set_put_bucket_website_responses([
      ...>  {"bucket", fn _bucket, _config -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_bucket_website_responses(fun()) :: :ok
  def set_put_bucket_website_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_bucket_website, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_object`.

  ## Examples

      iex> AWSSandboxS3.set_put_object_responses([
      ...>  {"bucket", fn _bucket, _object, _body, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _body -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_object_responses(fun()) :: :ok
  def set_put_object_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_object, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_object_acl`.

  ## Examples

      iex> AWSSandboxS3.set_put_object_acl_responses([
      ...>  {"bucket", fn _bucket, _object, _acl -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_object_acl_responses(fun()) :: :ok
  def set_put_object_acl_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_object_acl, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_object_copy`.

  ## Examples

      iex> AWSSandboxS3.set_put_object_copy_responses([
      ...>  {"bucket", fn _dest_bucket, _dest_object, _src_bucket, _src_object, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _dest_bucket, _dest_object, _src_bucket, _src_object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _dest_bucket, _dest_object, _src_bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _dest_bucket, _dest_object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _dest_bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_object_copy_responses(fun()) :: :ok
  def set_put_object_copy_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_object_copy, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `put_object_tagging`.

  ## Examples

      iex> AWSSandboxS3.set_put_object_tagging_responses([
      ...>  {"bucket", fn _bucket, _object, _tags, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _tags -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_put_object_tagging_responses(fun()) :: :ok
  def set_put_object_tagging_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:put_object_tagging, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `upload`.

  ## Examples

      iex> AWSSandboxS3.set_upload_responses([
      ...>  {"bucket", fn _source, _bucket, _path, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _source, _bucket, _path -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _source, _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _source -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_upload_responses(fun()) :: :ok
  def set_upload_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:upload, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `upload_part`.

  ## Examples

      iex> AWSSandboxS3.set_upload_part_responses([
      ...>  {"bucket", fn _bucket, _object, _upload_id, _part_number, _body, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _upload_id, _part_number, _body -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _upload_id, _part_number -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _upload_id -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_upload_part_responses(fun()) :: :ok
  def set_upload_part_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:upload_part, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Set a response for the function `upload_part_copy`.

  ## Examples

      iex> AWSSandboxS3.set_upload_part_copy_responses([
      ...>  {"bucket", fn _bucket, _object, _upload_id, _part_number, _body, _options -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _upload_id, _part_number, _body -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _upload_id, _part_number -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object, _upload_id -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket, _object -> :ok end},
      ...>  # or
      ...>  {"bucket", fn _bucket -> :ok end},
      ...>  # or
      ...>  {"bucket", fn -> :ok end},
      ...>  {~r|bucket.*|, fn -> :ok end}
      ...> ])
      :ok
  """
  @spec set_upload_part_copy_responses(fun()) :: :ok
  def set_upload_part_copy_responses(tuples) do
    tuples
    |> Map.new(fn {bucket, func} -> {{:upload_part_copy, bucket}, func} end)
    |> then(&SandboxRegistry.register(@registry, @state, &1, @keys))
    |> then(fn
      :ok -> :ok
      {:error, :registry_not_started} -> raise_not_started!()
    end)

    Process.sleep(@sleep)
  end

  @doc """
  Sets current pid to not use the sandbox.

  How to use

  ```elixir
   import SharedUtils.Support.HTTPSandbox, only: [disable_http_sandbox: 1]

  setup :disable_http_sandbox
  ```

  ## Examples

      iex> AWSSandboxS3.disable_http_sandbox()
      :ok
  """
  @spec disable_http_sandbox :: :ok
  def disable_http_sandbox do
    with {:error, :registry_not_started} <-
           SandboxRegistry.register(@registry, @disabled, %{}, @keys) do
      raise_not_started!()
    end
  end

  @doc """
  Check if sandbox for current pid was disabled by `disable_http_sandbox/1`

  ## Examples

      iex> AWSSandboxS3.disable_http_sandbox()
      ...> AWSSandboxS3.sandbox_disabled?
      true
  """
  @spec sandbox_disabled? :: boolean
  def sandbox_disabled? do
    case SandboxRegistry.lookup(@registry, @disabled) do
      {:ok, _} -> true
      {:error, :registry_not_started} -> raise_not_started!()
      {:error, :pid_not_registered} -> false
    end
  end

  @doc """
  Find the response function registered to the current pid or one of it's ancestors. Raises on error.

  ## Examples

      iex> AWSSandboxS3.set_list_buckets_responses(fn -> {:ok, ["example"]} end)
      ...> func = AWSSandboxS3.find!(:list_buckets)
      ...> func.()
      {:ok, ["example"]}
  """
  @spec find!(action()) :: fun()
  def find!(action) do
    case SandboxRegistry.lookup(@registry, @state) do
      {:ok, funcs} ->
        check_response!(funcs, action)

      {:error, :pid_not_registered} ->
        raise """
        No functions registered for #{inspect(self())}
        Action: #{inspect(action)}

        To fix this error use the following example in your test:

        ```
        #{format_example(action)}
        ```
        """

      {:error, :registry_not_started} ->
        raise_not_started!()
    end
  end

  @doc """
  Find the response function registered to the current pid or one of it's ancestors. Raises on error.

  ## Examples

      iex> AWSSandboxS3.set_list_objects_responses([{"bucket", fn -> :ok end}])
      ...> func = AWSSandboxS3.find!(:list_objects, "bucket")
      ...> func.()
      :ok
  """
  @spec find!(action(), bucket()) :: fun()
  def find!(action, bucket) do
    case SandboxRegistry.lookup(@registry, @state) do
      {:ok, funcs} ->
        find_response!(funcs, action, bucket)

      {:error, :pid_not_registered} ->
        raise """
        No functions registered for #{inspect(self())}
        Action: #{inspect(action)}
        Bucket: #{inspect(bucket)}

        To fix this error use the following example in your test:

        ```
        #{format_example(action, bucket)}
        ```
        """

      {:error, :registry_not_started} ->
        raise_not_started!()
    end
  end

  defp find_response!(funcs, action, bucket) do
    key = {action, bucket}

    with funcs when is_map(funcs) <- Map.get(funcs, key, funcs),
         regexes <- Enum.filter(funcs, fn {{_, k}, _v} -> Regex.regex?(k) end),
         {_regex, func} when is_function(func) <-
           Enum.find(regexes, funcs, fn {{_, k}, _v} -> Regex.match?(k, bucket) end) do
      func
    else
      func when is_function(func) ->
        func

      functions when is_map(functions) ->
        functions_text =
          Enum.map_join(
            functions,
            "\n",
            fn {k, v} ->
              "#{inspect(k)}  =>  #{inspect(v)}"
            end
          )

        raise """
        Function not found for action '#{inspect(action)}' and bucket '#{inspect(bucket)}' in #{inspect(self())}.

        Found:

        %{
          #{functions_text}
        }

        To fix this error use the following example in your test:

        ```
        #{format_example(action, bucket)}
        ```
        """

      other ->
        raise """
        Unrecognized input for {action, bucket} in #{inspect(self())}

        Did you use
        fn -> function() end
        in your set_get_responses/1 ?

        Found:
        #{inspect(other)}

        To fix this error use the following example in your test:

        ```
        #{format_example(action, bucket)}
        ```
        """
    end
  end

  defp check_response!(func, _action) when is_function(func), do: func

  defp check_response!(val, action) do
    raise """
    Function not found for action '#{inspect(action)}' in #{inspect(self())}.

    Found:

    #{val}

    To fix this error use the following example in your test:

    ```
    #{format_example(action)}
    ```
    """
  end

  defp format_example(action, bucket) do
    """
    setup do
      AWSSandboxS3.set_#{action}_responses([
        {#{inspect(bucket)}, fn bucket, _arg -> _response end},
        # or
        {#{inspect(bucket)}, fn bucket -> _response end},
        # or
        {#{inspect(bucket)}, fn -> _response end},
        # or
        {~r|bucket.*|, fn -> _response end}
      ])
    end
    """
  end

  defp format_example(action) do
    """
    setup do
      AWSSandboxS3.set_#{action}_responses(fn  -> _response end)
    end
    """
  end

  defp raise_not_started! do
    raise """
    Registry not started for AWSSandboxS3.
    Please add the line:

    AWSSandboxS3.start_link()

    to test_helper.exs for the current app.
    """
  end
end
