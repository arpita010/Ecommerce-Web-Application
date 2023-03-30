<div class="modal fade" id="editCategoryModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4>Edit Category</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

			</div>
			<div class="modal-body">
				<form action="editCategory" method="post">
					<input type="hidden" name="operation" value="edit"> <input
						type="hidden" name="cId" id="cId" value="">
					<div class="form-group">
						<input type="text" name="newName"
							placeholder="Enter new Category Name"
							class="form-control text-center">
					</div>
					<div class="form-group">
						<input type="text" name="newDesc"
							placeholder="Enter new Description"
							class="form-control text-center">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-danger">Save Changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>